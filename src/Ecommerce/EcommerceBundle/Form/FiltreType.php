<?php

namespace Ecommerce\EcommerceBundle\Form;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Range;



class FiltreType extends AbstractType

{

    public function buildForm(FormBuilderInterface $builder, array $options)

    {

        $poids = array();

        $prix = array();



        $minPoidsValue = 100;

        $maxPoidsValue = 20000;

        $minPrixValue = 0;

        $maxPrixValue = 100000;



        foreach (range($minPoidsValue, $maxPoidsValue, 100) as $i) {

            $poids [$i] = $i;

        }

        foreach (range($minPrixValue, $maxPrixValue, 10000) as $i) {

            $prix[$i] = $i;

        }

        $builder


            ->add('categorie', 'entity', array(
                'class' => 'EcommerceBundle:Categorie',
                'property' => 'titre',
                'empty_value' => 'Tout',
                'required' => false

            ))
            ->add('tag', 'entity', array('class' => 'EcommerceBundle:Tag', 'property' => 'nom', 'empty_value' => 'Tout', 'required' => false))
            ->add('titre', 'text', array('required' => false))
            ->add('poids_Min', 'choice', array('choices' => $poids))
            ->add('poids_Max', 'choice', array('choices' => $poids, 'data' => $maxPoidsValue))
            ->add('prix_Min', 'choice', array('choices' => $prix))
            ->add('prix_Max', 'choice', array('choices' => $prix, 'data' => $maxPrixValue));


    }

    public function getName()

    {

        return 'ecommerce_ecommercebundle_filtre';

    }

}