<?php

namespace Ecommerce\EcommerceBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProduitType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('vignette')
            ->add('date', 'datetime', array (
                'widget' => 'single_text',
                'html5' => false,
            ))
            ->add('titre')
            ->add('description')
            ->add('prix')
            ->add('poids')
            ->add('etat')
            ->add('categories')
            ->add('tags')
            ->add('images')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Ecommerce\EcommerceBundle\Entity\Produit'
        ));
    }
}
