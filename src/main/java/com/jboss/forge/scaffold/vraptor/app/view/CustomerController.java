package com.jboss.forge.scaffold.vraptor.app.view;

import org.hibernate.Session;

import com.jboss.forge.scaffold.vraptor.app.model.Customer;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class CustomerController {
	
	private Session session;
	
	public CustomerController(Session session) {
        this.session = session;
	}

    @Path("/")
	public void customer() {
        System.out.println("Session injetada: " + session);
        Customer customer = new Customer();
        customer.setFirstName("Rubens");
        customer.setLastName("Saraiva");
        //session.getTransaction().begin();
        session.persist(customer);
        //session.getTransaction().commit();
	}
}
