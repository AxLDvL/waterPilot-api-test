<?php

namespace App\Controller;


use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;

class LoginController extends AbstractController
{
    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    #[Route('/api/login', name: 'api_login')]

    public function index(): Response
    {
        /** @var User|null $user */
        $user = $this->security->getUser();
        
         if (null === $user) {
             return $this->json([
                 'message' => 'missing credentials',
             ], Response::HTTP_UNAUTHORIZED);
         }

         $token = "..."; // somehow create an API token for $user

          return $this->json([     
             'user'  => $user->getUserIdentifier(),
             'token' => $token,
          ]);
      }
}
