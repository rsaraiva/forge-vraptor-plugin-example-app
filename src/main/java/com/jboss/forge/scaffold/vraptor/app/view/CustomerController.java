package com.jboss.forge.scaffold.vraptor.app.view;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

import com.jboss.forge.scaffold.vraptor.app.model.Customer;

@Resource
public class CustomerController {

	private Session session;
	private final Result result;

	public CustomerController(Session session, Result result) {
		this.session = session;
		this.result = result;
	}

	@Get
	public void search() {
		result.include("customers", session.createCriteria(Customer.class).list());
	}

	@Post
	public void search(Customer customer) {

		Criteria criteria = session.createCriteria(Customer.class);
		if (customer.getFirstName() != null && !"".equals(customer.getFirstName())) {
			criteria.add(Restrictions.like("firstName", "%" + customer.getFirstName() + "%"));
		}
		if (customer.getLastName() != null && !"".equals(customer.getLastName())) {
			criteria.add(Restrictions.like("lastName", "%" + customer.getLastName() + "%"));
		}
		result.include("customers", criteria.list());
	}

	public void create() {
	}

	@Path("/customer/view/{customer.id}")
	@Get
	public void view(Customer customer) {
		result.include("customer", session.load(Customer.class, customer.getId()));
	}

	@Path("/customer/edit/{customer.id}")
	@Get
	public void edit(Customer customer) {
		result.include("customer", session.load(Customer.class, customer.getId()));
	}

	public void save(Customer customer) {

		if (customer.getId() == null) {
			session.persist(customer);
		} else {
			session.merge(customer);
		}

		result.redirectTo(CustomerController.class).search();
	}
}
