<?php
class Database {
    private $server = 'svr-freehost';
    private $username = 'cqfzvzkv_thuanht';
    private $password = 'thuan2k3yg';
    private $dbname = 'cqfzvzkv_eatez';
    private $conn = null;

    function __construct() {
        $this->connect();
    }

    private function connect() {
        $this->conn = new mysqli($this->server, $this->username, $this->password, $this->dbname);
        if ($this->conn->connect_error) {
            die("Lỗi kết nối: " . $this->conn->connect_error);
        }
    }

    public function query($sql) {
        $result = $this->conn->query($sql);
        return $result;
    }

    public function escapeString($str) {
        return mysqli_real_escape_string($this->conn, $str);
    }

    public function close() {
        $this->conn->close();
    }
}
?>
