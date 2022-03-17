<?php

/**
 * @see https://github.com/dotkernel/frontend/ for the canonical source repository
 * @copyright Copyright (c) 2017 Apidemia (https://www.apidemia.com)
 * @license https://github.com/dotkernel/frontend/blob/master/LICENSE.md MIT License
 */

declare(strict_types=1);

namespace Frontend\Classs\Entity;

use Frontend\App\Common\AbstractEntity;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class Grades
 * @package Frontend\Frontend\Classs\Entity
 *
 * @ORM\Entity(repositoryClass="Frontend\Classs\Repository\ClassRepository")
 * @ORM\Table(name="grade")
 * @ORM\HasLifecycleCallbacks
 * @package Frontend\Classs\Entity
 */
class Grades extends AbstractEntity
{
    public const PLATFORM_WEBSITE = 'website';
    public const PLATFORM_ADMIN = 'admin';

    /**
     * @ORM\OneToOne(targetEntity="Frontend\User\Entity\User", cascade={"persist", "remove"}, mappedBy="grades")
     * @var string
     */
    protected $studentId;

    /**
     * @ORM\OneToOne(targetEntity="Frontend\Classs\Entity\Classs", cascade={"persist", "remove"}, mappedBy="grades")
     * @var string
     */
    protected $classId;

    /**
     * @ORM\Column(name="grade", type="int")
     * @var string
     */
    protected $grade;

    /**
     * Message constructor.
     * @param string $studentId
     * @param string $classId
     * @param string $grade
     */
    public function __construct(
        string $studentId,
        string $classId,
        string $grade
    ) {
        parent::__construct();

        $this->studentId = $studentId;
        $this->classId = $classId;
        $this->grade = $grade;
    }

    /**
     * @return string
     */
    public function getStudentId()
    {
        return $this->studentId;
    }

    /**
     * @return string
     */
    public function getClassId()
    {
        return $this->classId;
    }

    /**
     * @return string
     */
    public function getGrade(): int
    {
        return $this->grade;
    }

    /**
     * @return string
     */
    public function getPlatform(): string
    {
        return $this->platform;
    }

    /**
     * @param string $platform
     */
    public function setPlatform(string $platform): void
    {
        $this->platform = $platform;
    }
}
