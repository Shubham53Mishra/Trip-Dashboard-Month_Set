 <?php

session_start();
ob_start();
include "common/link.php";
include "common/connection.php";

// Check if the user is logged in and get the logged-in user's email
if (!isset($_SESSION['email'])) {
    die("User not logged in");
}
$logged_in_vendor_email_id = $_SESSION['email'];

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "trip_db";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Date filter logic
$date_filter = isset($_GET['date_filter']) ? $_GET['date_filter'] : date('Y-m');

// Define the start and end date for the selected month
$start_date = date('Y-m-01', strtotime($date_filter));
$end_date = date('Y-m-t', strtotime($date_filter));

// SQL query to retrieve required fields, including the latest comment for each trip
$sql = "SELECT trip.trans_id, trip.drop_date, trip.pickup_date, trip.customer_name, trip.customer_mobile, trip.bikes_id, trip.rent, trip.amount_paid, trip.vendor_email_id, latest_comments.comment
        FROM trip
        LEFT JOIN (
            SELECT c1.trans_id, c1.comment
            FROM comment c1
            INNER JOIN (
                SELECT trans_id, MAX(time) as latest_time
                FROM comment
                GROUP BY trans_id
            ) c2 ON c1.trans_id = c2.trans_id AND c1.time = c2.latest_time
        ) latest_comments ON trip.trans_id = latest_comments.trans_id
        WHERE trip.drop_date BETWEEN ? AND ? 
        AND trip.admin_status != 'cancelled'  -- Excluding cancelled trips
        AND DATEDIFF(trip.drop_date, trip.pickup_date) > 6 -- Booking tenure more than 6 days
        AND trip.vendor_email_id = ? -- Filter by logged-in vendor
        ORDER BY trip.drop_date ASC"; // Sorting in ascending order

$stmt = $conn->prepare($sql);
if (!$stmt) {
    die("Preparation failed: " . $conn->error);
}

$stmt->bind_param('sss', $start_date, $end_date, $logged_in_vendor_email_id);
$stmt->execute();
$result = $stmt->get_result();

// Handle form submission for adding comments
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $trans_id = $_POST['trans_id'];
    $comment = $_POST['comment'];
    $username = $_POST['username']; // Get the username from the form
    $time = date('Y-m-d H:i:s');

    $sql_insert = "INSERT INTO comment (trans_id, comment, username, time) VALUES (?, ?, ?, ?)"; // Include username

    try {
        $insert_stmt = $conn->prepare($sql_insert);
        if (!$insert_stmt) {
            throw new Exception("Insert preparation failed: " . $conn->error);
        }
        $insert_stmt->bind_param('ssss', $trans_id, $comment, $username, $time);
        
        if ($insert_stmt->execute()) {
            $message = "Comment added successfully!";
        } else {
            throw new Exception("Error: " . $insert_stmt->error);
        }
    } catch (Exception $e) {
        $message = $e->getMessage();
    }

    // Redirect to the same page to prevent form resubmission
    header("Location: " . $_SERVER['PHP_SELF'] . "?date_filter=" . urlencode($date_filter));
    exit;
}

// Fetch comments for viewing
if (isset($_GET['view_comments'])) {
    $trans_id = $_GET['view_comments'];
    $comment_sql = "SELECT trans_id, username, comment, time FROM comment WHERE trans_id = ?";
    $comment_stmt = $conn->prepare($comment_sql);
    $comment_stmt->bind_param('s', $trans_id);
    $comment_stmt->execute();
    $comment_result = $comment_stmt->get_result();

    $comments = [];
    while ($row = $comment_result->fetch_assoc()) {
        $comments[] = $row;
    }

    // Create a HTML table to display comments
    $comment_table = '<table class="table table-bordered">';
    $comment_table .= '<thead><tr><th>Trans ID</th><th>Username</th><th>Comment</th><th>Time</th></tr></thead>';
    $comment_table .= '<tbody>';
    foreach ($comments as $comment) {
        $comment_table .= '<tr>';
        $comment_table .= '<td>' . htmlspecialchars($comment["trans_id"]) . '</td>';
        $comment_table .= '<td>' . htmlspecialchars($comment["username"]) . '</td>';
        $comment_table .= '<td>' . htmlspecialchars($comment["comment"]) . '</td>';
        $comment_table .= '<td>' . htmlspecialchars($comment["time"]) . '</td>';
        $comment_table .= '</tr>';
    }
    $comment_table .= '</tbody>';
    $comment_table .= '</table>';

    echo $comment_table;
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Long Term Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .dashboard {
            max-width: 1500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
        }

        .search-bar {
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-bar input {
            padding: 10px;
            width: 45%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
        }

        th,
        td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        td.comment {
            width: 250px;
        }

        .drop-date {
            width: 190px;
        }

        .pickup-date {
            width: 190px;
        }

        .customer-name {
            width: 190px;
        }
    </style>
</head>

<body>
    <div class="dashboard">
        <h1>Long Term Booking</h1>

        <!-- Date Filter Form -->
        <div class="search-bar">
            <form method="get" action="">
                <label for="date_filter" style="font-weight: bold;">Select Month:</label>
                <input type="month" id="date_filter" name="date_filter" value="<?php echo htmlspecialchars($date_filter); ?>" style="font-weight: bold;">
                <button type="submit" class="btn btn-warning" style="font-weight: bold;">Filter</button>
            </form>
        </div>

        <!-- Modal for adding comment -->
        <div class="modal fade" id="addCommentModal" tabindex="-1" role="dialog" aria-labelledby="addCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCommentModalLabel">Add Comment</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                            <div class="form-group">
                                <label for="trans_id">Trans ID</label>
                                <input type="text" class="form-control" id="trans_id" name="trans_id" readonly>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username" name="username" value="<?php echo htmlspecialchars($logged_in_vendor_email_id); ?>" required readonly>
                            </div>
                            <div class="form-group">
                                <label for="comment">Comment</label>
                                <textarea class="form-control" name="comment" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for viewing comments -->
        <div class="modal fade" id="viewCommentModal" tabindex="-1" role="dialog" aria-labelledby="viewCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 80%;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewCommentModalLabel">Comments</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <!-- <th>Trans ID</th>
                                    <th>Username</th>
                                    <th>Comment</th>
                                    <th>Time</th> -->
                                </tr>
                            </thead>
                            <tbody id="commentList">
                                <!-- Comments will be dynamically inserted here -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <?php if ($result->num_rows > 0): ?>
            <table class="table">
                <tr>
                    <th>Trans ID</th>
                    <th class="drop-date">Drop Date</th>
                    <th class="pickup-date">Pickup Date</th> <!-- Added class for Pickup Date column -->
                    <th class="customer-name">Customer Name</th> <!-- Added class for Customer Name column -->
                    <th>Customer Mobile</th>
                    <th>Bikes ID</th>
                    <th>Rent</th>
                    <th>Amount Paid</th>
                    <th style="width: 50px;">Latest Comment</th>
                    <th>Add Comment</th>
                    <th>WhatsApp</th>
                </tr>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row["trans_id"]) ?></td>
                        <td class="drop-date"><?= htmlspecialchars($row["drop_date"]) ?></td>
                        <td class="pickup-date"><?= htmlspecialchars($row["pickup_date"]) ?></td>  
                        <td class="customer-name"><?= htmlspecialchars($row["customer_name"]) ?></td> 
                        <td><?= htmlspecialchars($row["customer_mobile"]) ?></td>
                        <td><?= htmlspecialchars($row["bikes_id"]) ?></td>
                        <td><?= htmlspecialchars($row["rent"]) ?></td>
                        <td><?= htmlspecialchars($row["amount_paid"]) ?></td>
                        <td class="comment"><?= htmlspecialchars($row["comment"]) ?></td>
                        <td>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCommentModal" data-trans-id="<?= htmlspecialchars($row["trans_id"]) ?>">
                                    <i class="fas fa-plus-circle"></i>
                                </button>
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#viewCommentModal" data-trans-id="<?= htmlspecialchars($row["trans_id"]) ?>">
                                    <i class="fas fa-list"></i>
                                </button>
                            </div>
                        </td>
                        <td>
                            <button class="btn btn-success" onclick="sendWhatsApp('<?= htmlspecialchars($row['customer_mobile']) ?>')">
                                <i class="fab fa-whatsapp"></i>
                            </button>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </table>
        <?php else: ?>
            <p>No records found for the selected month.</p>
        <?php endif; ?>

    </div>

    <!-- JavaScript libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Handle Add Comment Modal
        $('#addCommentModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var transId = button.data('trans-id');
            var modal = $(this);
            modal.find('#trans_id').val(transId); // Set trans_id in the modal input
        });

        // Handle View Comment Modal
        $('#viewCommentModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var transId = button.data('trans-id');
            var modal = $(this);
            var commentList = document.getElementById('commentList');

            // Clear the existing comments
            commentList.innerHTML = '';

            // Fetch comments via AJAX
            fetch(`?view_comments=${transId}`)
                .then(response => response.text())
                .then(data => {
                    commentList.innerHTML = data;
                });
        });

        function sendWhatsApp(customerMobile) {
            // Log the customer mobile to check if it's being passed correctly
            console.log("Customer Mobile:", customerMobile);

            // Make sure the mobile number is in the correct format (remove non-numeric characters)
            const formattedMobile = customerMobile.replace(/\D/g, '');

            // Check if the number starts with a country code (e.g., +91 for India), if not, add it
            const countryCode = '91'; // Replace this with your country code
            const mobileWithCountryCode = formattedMobile.startsWith(countryCode) ? formattedMobile : countryCode + formattedMobile;

            // Encode the message text properly to avoid any issues with special characters
            const message = encodeURIComponent("Hello, I'm reaching out from [Your Business Name]. How can we assist you today?");

            // Create the WhatsApp URL with the formatted mobile number and encoded message
            const whatsappUrl = `https://wa.me/${mobileWithCountryCode}?text=${message}`;

            // Log the generated URL to verify
            console.log("WhatsApp URL:", whatsappUrl);

            // Open WhatsApp in a new window/tab
            window.open(whatsappUrl, '_blank');
        }
    </script>
</body>

</html>
