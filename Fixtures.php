<?php
declare(strict_types=1);

class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            //$connection->beginTransaction();
            //$this->cleanup();
            //$connection->commit();

            $connection->beginTransaction();

            //$this->generateEmployees(50);
            //$this->generateSalaries(1000000);
            //$this->generateTransport(50);
            $this->generateTransportData(1000000);

            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomFirstName(): string
    {
        static $randomNames = ['Norbert','Damon','Laverna','Annice','Brandie','Emogene','Cinthia','Magaret','Daria','Ellyn','Rhoda','Debbra','Reid','Desire','Sueann','Shemeka','Julian','Winona','Billie','Michaela','Loren','Zoraida','Jacalyn','Lovella','Bernice','Kassie','Natalya','Whitley','Katelin','Danica','Willow','Noah','Tamera','Veronique','Cathrine','Jolynn','Meridith','Moira','Vince','Fransisca','Irvin','Catina','Jackelyn','Laurine','Freida','Torri','Terese','Dorothea','Landon','Emelia'];
        return $randomNames[array_rand($randomNames)];
    }

    private function getRandomLastName(): string
    {
        static $randomNames = ['Sanger','Farver','Kishlansky','Petaev','Abdollah','Emogene','Cinthia','Magaret','Daria','Ellyn','Rhoda','Debbra','Reid','Desire','Sueann','Shemeka','Julian','Winona','Billie','Michaela','Loren','Zoraida','Jacalyn','Lovella','Bernice','Kassie','Natalya','Whitley','Katelin','Danica','Willow','Noah','Tamera','Veronique','Cathrine','Jolynn','Meridith','Moira','Vince','Fransisca','Irvin','Catina','Jackelyn','Laurine','Freida','Torri','Terese','Dorothea','Landon','Emelia'];
        return $randomNames[array_rand($randomNames)];
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=gor_electro_trans', 'admin', 'admin', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();

    }

    /**
     * @return array
     */
    private function getDriversId(): array
    {
        $connection = $this->getConnection();
        return $connection->query('SELECT e.employee_id FROM employee e WHERE e.position_id IN (1,7)')->fetchAll();
    }

    /**
     * @return array
     */
    private function getTransportId(): array
    {
        $connection = $this->getConnection();
        return $connection->query('SELECT tr.transport_id FROM transport tr')->fetchAll();
    }

    /**
     * @return array
     */
    private function getEmployees(): array
    {
        $connection = $this->getConnection();
        return $connection->query('SELECT e.employee_id, e.salary FROM employee e')->fetchAll();
    }

    /**
     * @param int $employeesCount
     * @throws Exception
     */
    public function generateEmployees(int $employeesCount)
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        $start = microtime(true);

        $positionId = $firstName = $lastName = $email = $dob = $salary = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 65);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 18);

        $statement = $connection->prepare('INSERT INTO employee (position_id, first_name, last_name, email, dob, salary)
            VALUES (:positionId, :firstName, :lastName, :email, :dob, :salary)
            ON DUPLICATE KEY UPDATE first_name=VALUES(first_name), last_name=VALUES(last_name)'
        );

        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':firstName', $firstName);
        $statement->bindParam(':lastName', $lastName);
        $statement->bindParam(':email', $email);
        $statement->bindParam(':salary', $salary);
        $statement->bindParam(':dob', $dob);

        for ($i = 0; $i < $employeesCount; $i++) {
            $positionId = random_int(1, 7);
            $firstName = $this->getRandomFirstName();
            $lastName = $this->getRandomLastName();
            $email = $firstName . '_' . $lastName . '@example.com';
            $salary = random_int(6, 20) * 500;
            $dob = date('Y-m-d', random_int($minAgeTimestamp, $maxAgeTimestamp));
            $statement->execute();
        }

        echo 'Create employees: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $salariesCount
     * @throws Exception
     */
    public function generateSalaries(int $salariesCount): void
    {
        $connection = $this->getConnection();

        $start = microtime(true);

        $employeeId = $amount = $salaryDate = '';
        $minTimestamp = strtotime('11-12-16');
        $maxTimestamp = time();

        $statement = $connection->prepare('INSERT INTO salary (employee_id, amount, salary_date)
            VALUES (:employeeId, :amount, :salaryDate)
            ON DUPLICATE KEY UPDATE salary_date=VALUES(salary_date)'
        );

        $statement->bindParam(':employeeId', $employeeId);
        $statement->bindParam(':amount', $amount);
        $statement->bindParam(':salaryDate', $salaryDate);

        $employees = $this->getEmployees();

        for ($i = 0; $i < $salariesCount; $i++) {
            $employee = $employees[array_rand($employees)];
            $employeeId = $employee['employee_id'];
            $amount = $employee['salary'] + (random_int(1, 10) >= 5 ? 100 * (random_int(1, 10)) : 100 * (random_int(1, 10)) * -1);
            $salaryDate = date('Y-m-d', random_int($minTimestamp, $maxTimestamp));
            $statement->execute();
        }

        echo 'Create salary: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @return string
     * @throws Exception
     */
    private function createTransportNumber(): string
    {
        $series = ['CA', 'CB', 'CF', 'AA', 'BO', 'BB', 'TT'];

        return $series[array_rand($series)] . ' ' . random_int(1000, 9999) . ' ' . $series[array_rand($series)];
    }

    /**
     * @param int $transportsCount
     * @throws Exception
     */
    public function generateTransport(int $transportsCount): void
    {
        $connection = $this->getConnection();

        $start = microtime(true);

        $type = $number = '';

        $types = ['Škoda 22TrG', 'ElectroLAZ-12', 'ЗиУ-5'];

        $statement = $connection->prepare('INSERT INTO transport (type, number)
            VALUES (:type, :number)
            ON DUPLICATE KEY UPDATE number=VALUES(number)'
        );

        $statement->bindParam(':type', $type);
        $statement->bindParam(':number', $number);

        for ($i = 0; $i < $transportsCount; $i++) {
            $type = $types[array_rand($types)];
            $number = $this->createTransportNumber();
            $statement->execute();
        }

        echo 'Create transport: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $transportDataCount
     * @throws Exception
     */
    public function generateTransportData(int $transportDataCount): void
    {
        $connection = $this->getConnection();

        $start = microtime(true);

        $employeeId = $transportId = $income = $date = '';

        $minTimestamp = strtotime('01-01-17');
        $maxTimestamp = time();

        $statement = $connection->prepare('INSERT INTO transport_data (employee_id, transport_id, income, date)
            VALUES (:employeeId, :transportId, :income, :date)
            ON DUPLICATE KEY UPDATE date=VALUES(date)'
        );

        $statement->bindParam(':employeeId', $employeeId);
        $statement->bindParam(':transportId', $transportId);
        $statement->bindParam(':income', $income);
        $statement->bindParam(':date', $date);

        $drivers = $this->getDriversId();
        $transports = $this->getTransportId();

        for ($i = 0; $i < $transportDataCount; $i++) {
            $driver = $drivers[array_rand($drivers)];
            $transport = $transports[array_rand($transports)];

            $employeeId = $driver['employee_id'];
            $transportId = $transport['transport_id'];
            $income = 200 + random_int(0, 6000);
            $date = date('Y-m-d', random_int($minTimestamp, $maxTimestamp));

            $statement->execute();
        }

        echo 'Create transport data: ' . (microtime(true) - $start) . "\n";
    }
}

$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();