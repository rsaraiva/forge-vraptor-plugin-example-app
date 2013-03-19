package com.jboss.forge.scaffold.vraptor.app.view;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

import com.jboss.forge.scaffold.vraptor.app.model.Customer;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;
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
        CriteriaQuery<Customer> criteria = entityManager.getCriteriaBuilder().createQuery(Customer.class);
        Root<Customer> personRoot = criteria.from(Customer.class);
        criteria.select(personRoot);
        result.include("customers", entityManager.createQuery(criteria).getResultList());
    }

//    @Post
//    public void search(Customer customer) {
//
//        Criteria criteria = session.createCriteria(Customer.class);
//        if (customer.getFirstName() != null && !"".equals(customer.getFirstName())) {
//            criteria.add(Restrictions.like("firstName", "%" + customer.getFirstName() + "%"));
//        }
//        if (customer.getLastName() != null && !"".equals(customer.getLastName())) {
//            criteria.add(Restrictions.like("lastName", "%" + customer.getLastName() + "%"));
//        }
//        result.include("customers", criteria.list());
//    }
//
//    public void create() {
//    }
//
//    @Path("/customer/view/{customer.id}")
//    @Get
//    public void view(Customer customer) {
//        result.include("customer", session.load(Customer.class, customer.getId()));
//    }
//
//    @Path("/customer/edit/{customer.id}")
//    @Get
//    public void edit(Customer customer) {
//        result.include("customer", session.load(Customer.class, customer.getId()));
//    }
//
//    public void save(Customer customer) {
//
//        if (customer.getId() == null) {
//            session.persist(customer);
//        } else {
//            session.merge(customer);
//        }
//
//        result.redirectTo(CustomerController.class).search();
//    }
}
