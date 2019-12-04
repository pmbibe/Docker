<?php
$link = mysqli_connect("192.168.141.203", "msandbox", "msandbox", "sum");
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
echo "Connect Successfully. Host info: " . mysqli_get_host_info($link);
echo "<br>";
$sql = "SELECT Number1, Number2, Sum  FROM sum.helloworld;";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo "id: " . $row["Number1"]. " - Name: " . $row["Number2"]. " " . $row["Sum"]. "<br>";
    }
} else {
    echo "0 results";
}

mysqli_close($conn);
?>
