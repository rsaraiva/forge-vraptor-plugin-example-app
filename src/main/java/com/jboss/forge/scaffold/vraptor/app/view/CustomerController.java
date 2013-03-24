package com.jboss.forge.scaffold.vraptor.app.view;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import com.jboss.forge.scaffold.vraptor.app.model.Customer;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Resource
public class CustomerController {

    private EntityManager entityManager;
    private final Result result;

    public CustomerController(EntityManager entityManager, Result result) {
        this.entityManager = entityManager;
        this.result = result;
    }

    @Get
    public void search() {
        result.include("customers", entityManager.createQuery("from Customer c").getResultList());
    }
    
    private Predicate[] getSearchPredicates(Root<Customer> root, Customer example) {

        CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();
        List<Predicate> predicatesList = new ArrayList<Predicate>();
        
        String firstName = example.getFirstName();
        if (firstName != null && !"".equals(firstName)) { 
            predicatesList.add(builder.like(root.<String>get("firstName"), '%' + firstName + '%')); 
        }
        String lastName = example.getLastName();
        if (lastName != null && !"".equals(lastName)) { 
            predicatesList.add(builder.like(root.<String>get("lastName"), '%' + lastName + '%')); 
        }

        return predicatesList.toArray(new Predicate[predicatesList.size()]);
    }

    @Post
    public void search(Customer customer) {
        CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();
        CriteriaQuery<Customer> criteria = builder.createQuery(Customer.class);
        Root<Customer> root = criteria.from(Customer.class);
        TypedQuery<Customer> query = this.entityManager.createQuery(criteria.select(root).where(getSearchPredicates(root, customer)));
        result.include("customers", query.getResultList());
    }

    public void create() {
    }

    @Path("/customer/view/{customer.id}")
    @Get
    public void view(Customer customer) {
        result.include("customer", entityManager.find(Customer.class, customer.getId()));
    }

    @Path("/customer/edit/{customer.id}")
    @Get
    public void edit(Customer customer) {
        result.include("customer", entityManager.find(Customer.class, customer.getId()));
    }

    public void save(Customer customer) {
        if (customer.getId() == null) {
            entityManager.persist(customer);
        } else {
            entityManager.merge(customer);
        }
        result.redirectTo(CustomerController.class).search();
    }
    
    public void delete(Customer customer) {
        entityManager.remove(entityManager.find(Customer.class, customer.getId()));
        result.redirectTo(CustomerController.class).search();
    }
}
