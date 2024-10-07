 <?php
include 'common/connection.php'; 
session_start();
ob_start();

$vendor_name = "";
$vendor_email = "";
if (isset($_SESSION['email'])) {
    $vendor_email = mysqli_real_escape_string($con, $_SESSION['email']);
} else if (isset($_SESSION['vendor_email'])) {
    $vendor_email = mysqli_real_escape_string($con, $_SESSION['vendor_email']);
} else {
    header("location: login.php");
}
date_default_timezone_set("Asia/Kolkata");

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
    AND trip.admin_status != 'cancelled'
    AND DATEDIFF(trip.drop_date, trip.pickup_date) > 6
    AND trip.vendor_email_id = ?
    ORDER BY trip.drop_date ASC";

$stmt = $con->prepare($sql);
if (!$stmt) {
    die("Preparation failed: " . $con->error);
}

$stmt->bind_param('sss', $start_date, $end_date, $vendor_email);
$stmt->execute();
$result = $stmt->get_result();

// Calculate totals
$total_rent_paid = 0;
$total_booking = 0;
$total_amount_paid = 0;
$Stuck_cases = 0;

while ($row = $result->fetch_assoc()) {
    $total_rent_paid += $row['rent'];
    $total_booking++;
    $total_amount_paid += $row['amount_paid'];
}

// Fetch data again for display
$stmt->execute();
$result = $stmt->get_result();

// Handle form submission for adding comments
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $trans_id = $_POST['trans_id'];
    $comment = $_POST['comment'];
    $username = $_POST['username'];
    $time = date('Y-m-d H:i:s');

    $sql_insert = "INSERT INTO comment (trans_id, comment, username, time) VALUES (?, ?, ?, ?)";

    try {
        $insert_stmt = $con->prepare($sql_insert);
        if (!$insert_stmt) {
            throw new Exception("Insert preparation failed: " . $con->error);
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

    header("Location: " . $_SERVER['PHP_SELF'] . "?date_filter=" . urlencode($date_filter));
    exit;
}

// Fetch comments for viewing
if (isset($_GET['view_comments'])) {
    $trans_id = $_GET['view_comments'];
    $comment_sql = "SELECT trans_id, username, comment, time FROM comment WHERE trans_id = ?";
    $comment_stmt = $con->prepare($comment_sql);
    $comment_stmt->bind_param('s', $trans_id);
    $comment_stmt->execute();
    $comment_result = $comment_stmt->get_result();

    $comments = [];
    while ($row = $comment_result->fetch_assoc()) {
        $comments[] = $row;
    }

    $comment_table = '<table class="table table-bordered">';
    $comment_table .= '<thead><tr><th>Trans ID</th><th>Username</th><th>Comment</th><th>Time</th></thead>';
    $comment_table .= '<tbody>';
    foreach ($comments as $comment) {
        $comment_table .= '<tr>';
        $comment_table .= '<td style="background:white">' . htmlspecialchars($comment["trans_id"]) . '</td>';
        $comment_table .= '<td style="background:white">' . htmlspecialchars($comment["username"]) . '</td>';
        $comment_table .= '<td style="background:white">' . htmlspecialchars($comment["comment"]) . '</td>';
        $comment_table .= '<td style="background:white">' . htmlspecialchars($comment["time"]) . '</td>';
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
             max-width: 1600px;
             /* margin: 0 auto; */
             background: white;
             padding: 20px;
             /* min-height: calc(100vh - 100px); */
             box-sizing: border-box;

         }

         .search-bar {
             /* margin-bottom: 10px; */
             display: flex;
             justify-content: space-between;
             align-items: center;
         }

         .search-bar input {
             padding: 10px;
             width: 50%;
         }

         table {
             width: 100%;
             border-collapse: collapse;
             background-color: black;
            
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
             color: white;
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

         .highlight {
             background-color: lightgreen;
         }

         .done {
             background-color: lightblue;
         }

         .overdue {
             background-color: lightcoral;
         }

         .warning {
             background-color: yellow;
         }

         .rent-greater {
             background-color: lightgreen;
         }

         .logout-btn,
         .username {
             color: white;
         }
    </style>
</head>
<body>
    <?php include "common/navbar.php"; ?>

    <div class="dashboard">
        <div class="row mb-2 d-flex align-items-start">
            <div class="col-md-4">
                <div>
                    <h1>Long_Term_Booking</h1>
                </div>
                <div class="search-bar w-100">
                    <div style="display: flex; align-items: center; justify-content: flex-start;">
                        <form method="get" action="" style="display: flex; align-items: center; margin-top: 0;">
                            <label for="date_filter" style="font-weight: bold; margin: 0; width: 150px;">Select Month:</label>
                            <input type="month" id="date_filter" name="date_filter" value="<?php echo htmlspecialchars($date_filter); ?>" style="font-weight: bold; margin: 0 10px;">
                            <button type="submit" class="btn btn-warning" style="font-weight: bold; width: 140px; height: 40px; margin-right: 99px;">Filter</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8 d-flex justify-content-end">
                <div class="row w-100 d-flex justify-content-around">
                    <div class="col-md-3 card-gap">
                        <div class="card" style="background-color: black; color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Total Rent Paid</h5>
                                <p class="card-text"><?php echo htmlspecialchars($total_rent_paid); ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 card-gap">
                        <div class="card" style="background-color: black; color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Total Booking</h5>
                                <p class="card-text"><?php echo htmlspecialchars($total_booking); ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 card-gap">
                        <div class="card" style="background-color: black; color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Total Amount Paid</h5>
                                <p class="card-text"><?php echo htmlspecialchars($total_amount_paid); ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 card-gap">
                        <div class="card" style="background-color: black; color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Stock Value</h5>
                                <p class="card-text"><?php echo htmlspecialchars($Stuck_cases); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                                <input type="text" class="form-control" id="username" name="username" value="<?php echo htmlspecialchars($vendor_email); ?>" required readonly>
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
                            <tbody id="commentList">
                                <!-- Comments will be dynamically inserted here -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <?php if ($result->num_rows > 0): ?>
            <table class="table" style="margin-top: 10px;">
                <tr>
                    <th>S.No</th>
                    <th>Trans ID</th>
                    <th class="pickup-date">Pickup Date</th>
                    <th class="drop-date">Drop Date</th>
                    <th class="customer-name">Customer Name</th>
                    <th>Customer Mobile</th>
                    <th>Bikes ID</th>
                    <th>Rent</th>
                    <th>Amount Paid</th>
                    <th>Status</th> <!-- New Status column -->
                    <th style="width: 50px;">Latest Comment</th>
                    <th>Add Comment</th>
                    <th>WhatsApp</th>
                </tr>
                <?php
$sno = 1;
while ($row = $result->fetch_assoc()):
    $drop_date = new DateTime($row['drop_date']);
    $current_date = new DateTime();
    $interval = $current_date->diff($drop_date)->days;
    
    $is_overdue = $interval > 3 && $row['amount_paid'] < $row['rent'];
    $is_warning = $interval >= 0 && $interval <= 3 && $row['amount_paid'] != $row['rent'];
    $is_rent_greater = $row['amount_paid'] > $row['rent'];
    $is_done = $row['amount_paid'] == $row['rent'];

    // Determine the status and background color
    $status = 'Pending';
    $row_bg_color = 'background-color: white;';
    if ($is_done) {
        $status = 'Completed';
        $row_bg_color = 'background-color: lightgreen;';  
    } elseif ($is_overdue) {
        $status = 'Overdue';
        $row_bg_color = 'background-color: lightcoral;';
    } elseif ($is_warning) {
        $status = 'Warning';
        $row_bg_color = 'background-color: yellow;';
    } elseif ($is_rent_greater) {
        $status = 'Paid More';
        $row_bg_color = 'background-color: green;';
    }

    // Additional status logic
    if ($row['trans_id'] && strpos($row['trans_id'], 'e') !== false) {
        if ($row['amount_paid'] >= $row['rent']) {
            $status = 'Extended & Paid';
        } else {
            $status = 'Extended but not Paid';
        }
    }
?>
    <tr style="<?= $row_bg_color ?>">
        <td><?= $sno++ ?></td>
        <td><?= htmlspecialchars($row["trans_id"]) ?></td>
        <td class="pickup-date"><?= htmlspecialchars($row["pickup_date"]) ?></td>
        <td class="drop-date"><?= htmlspecialchars($row["drop_date"]) ?></td>
        <td class="customer-name"><?= htmlspecialchars($row["customer_name"]) ?></td>
        <td><?= htmlspecialchars($row["customer_mobile"]) ?></td>
        <td><?= htmlspecialchars($row["bikes_id"]) ?></td>
        <td><?= htmlspecialchars($row["rent"]) ?></td>
        <td><?= htmlspecialchars($row["amount_paid"]) ?></td>
        <td><?= htmlspecialchars($status) ?></td> <!-- Display the status -->
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

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $('#addCommentModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var transId = button.data('trans-id');
            var modal = $(this);
            modal.find('#trans_id').val(transId);
        });

        $('#viewCommentModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var transId = button.data('trans-id');
            var modal = $(this);
            var commentList = document.getElementById('commentList');

            commentList.innerHTML = '';

            fetch(`?view_comments=${transId}`)
                .then(response => response.text())
                .then(data => {
                    commentList.innerHTML = data;
                });
        });

        function sendWhatsApp(customerMobile) {
            console.log("Customer Mobile:", customerMobile);

            const formattedMobile = customerMobile.replace(/\D/g, '');
            const countryCode = '91';
            const mobileWithCountryCode = formattedMobile.startsWith(countryCode) ? formattedMobile : countryCode + formattedMobile;
            const message = encodeURIComponent("Hello, I'm reaching out from [Your Business Name]. How can we assist you today?");
            const whatsappUrl = `https://wa.me/${mobileWithCountryCode}?text=${message}`;

            console.log("WhatsApp URL:", whatsappUrl);

            window.open(whatsappUrl, '_blank');
        }
    </script>
</body>
</html>
