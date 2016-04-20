<?php

namespace Ecommerce\EcommerceBundle\Controller;

use Ecommerce\EcommerceBundle\Form\FiltreType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpFoundation\Request;


use Ecommerce\EcommerceBundle\Entity\Produit;
use Ecommerce\EcommerceBundle\Form\ProduitType;

class DefaultController extends Controller
{
    public function oldindexAction()
    {
        return $this->render('EcommerceBundle:Default:index.html.twig');
    }

    public function indexAction(Request $request)
    {
        $form = $this->createForm(new FiltreType());

        if ($request->getMethod() == 'POST') {
            //var_dump($request);

            $form->handleRequest($request);


            if ($form->isValid()) {

                $em = $this->getDoctrine()->getManager();
                $data = $request->request->get('ecommerce_ecommercebundle_filtre');
                $cat = $data['categorie'];
                //var_dump($cat);
                $liste_filtre = $em->getRepository('EcommerceBundle:Produit')->findProduitByParametres($data);


                return $this->render('EcommerceBundle:Default:listeFiltre.html.twig', array('produits' => $liste_filtre));

            }

        }

        $em = $this->getDoctrine()->getManager();


        $produits = $em->getRepository('EcommerceBundle:Produit')->findByEtat(1);



        return $this->render('EcommerceBundle:Default:liste.html.twig', array(
            'produits' => $produits,
            'form' => $form->createView()
        ));
    }

    public function showAction(Produit $produit)
    {


        return $this->render('EcommerceBundle:Default:detail.html.twig', array(
            'produit' => $produit,


        ));
    }
}
