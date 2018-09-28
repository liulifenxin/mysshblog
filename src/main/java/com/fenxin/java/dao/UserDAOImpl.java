package com.fenxin.java.dao;

import com.fenxin.java.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public int save(User u) {
        return (Integer) sessionFactory.getCurrentSession().save(u);
    }

    /*public List<User> findAll() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        return criteria.list();
    }*/

    public List<User> findAll() {
        //Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        System.out.println("1213");
        Session session = sessionFactory.getCurrentSession();
        //session.beginTransaction();
        //@SuppressWarnings("unchecked")
        //List<User> users = session.createQuery().getResultList();
        //注意导入的包是import javax.persistence.criteria.CriteriaQuery;
        System.out.println("1214");
        CriteriaQuery<User> criteriaQuery = session.getCriteriaBuilder().createQuery(User.class);
        //criteriaQuery 对象可以添加各种查询条件和关联条件等等
        System.out.println("1215");
        criteriaQuery.from(User.class);
        System.out.println("1216");
        List<User> list = session.createQuery(criteriaQuery).getResultList();
        System.out.println("1217");
        return list;
    }

}

