<?php
declare(strict_types=1);
/**
* @covers Calculator::A
*/
final class Email
{
    private $email;
    /**
    * @covers Calculator::Test
    */
    private function __construct(string $email)
    {
        $this->ensureIsValidEmail($email);
        $this->email = $email;
    }
     /**
     * @covers Calculator::B
     */
    public static function fromString(string $email): self
    {
        return new self($email);
    }
     /**
     * @covers Calculator::C
     */
    public function __toString(): string
    {
        return $this->email;
    }
    /**
     * @covers Calculator::D
     */
    private function ensureIsValidEmail(string $email): void
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new InvalidArgumentException(
                sprintf(
                    '"%s" is not a valid email address',
                    $email
                )
            );
        }
    }
}
