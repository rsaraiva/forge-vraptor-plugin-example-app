package com.jboss.forge.scaffold.vraptor.app.view;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import com.jboss.forge.scaffold.vraptor.app.model.Category;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Resource
public class CategoryController {

    private EntityManager entityManager;
    private final Result result;

    public CategoryController(EntityManager entityManager, Result result) {
        this.entityManager = entityManager;
        this.result = result;
    }

    @Get
    public void search() {
        result.include("entities", entityManager.createQuery("from Category c").getResultList());
    }

    private Predicate[] getSearchPredicates(Root<Category> root, Category example) {
        CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();
        List<Predicate> predicatesList = new ArrayList<Predicate>();
        String name = example.getName();
        if (name != null && !"".equals(name)) {
            predicatesList.add(builder.like(root.<String>get("name"), '%' + name + '%'));
        }

        return predicatesList.toArray(new Predicate[predicatesList.size()]);
    }

    @Post
    public void search(Category category) {
        CriteriaBuilder builder = this.entityManager.getCriteriaBuilder();
        CriteriaQuery<Category> criteria = builder.createQuery(Category.class);
        Root<Category> root = criteria.from(Category.class);
        TypedQuery<Category> query = this.entityManager.createQuery(criteria.select(root).where(getSearchPredicates(root, category)));
        result.include("entities", query.getResultList());
    }

    public void create() {
    }

    @Path("/category/view/{category.id}")
    @Get
    public void view(Category category) {
        result.include("category", entityManager.find(Category.class, category.getId()));
    }

    @Path("/category/edit/{category.id}")
    @Get
    public void edit(Category category) {
        result.include("category", entityManager.find(Category.class, category.getId()));
    }

    public void save(Category category) {
        if (category.getId() == null) {
            entityManager.persist(category);
        } else {
            entityManager.merge(category);
        }
        result.redirectTo(CategoryController.class).search();
    }

    public void delete(Category category) {
        entityManager.remove(entityManager.find(Category.class, category.getId()));
        result.redirectTo(CategoryController.class).search();
    }
}
