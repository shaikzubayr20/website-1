package ua.com.itinterview.dao;

import static org.junit.Assert.assertEquals;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import ua.com.itinterview.entity.InterviewEntity;
import ua.com.itinterview.entity.UserEntity;

public class InterviewDaoTest extends
	BaseEntityWithIdDaoIntegrationTest<InterviewEntity> {

    @Autowired
    private UserDao userDao;
    @Autowired
    private InterviewEntityDao interDao;

    @Override
    protected InterviewEntity createEntity() {
	InterviewEntity interview = new InterviewEntity();
	interview.setFeedback("jkjh");
	interview.setCreated(new Date());
	UserEntity user = new UserEntity();
	user.setEmail("dsakdj");
	user.setPassword("vcndt");
	user = userDao.save(user);
	interview.setUser(user);
	return interview;
    }

    @Override
    protected EntityWithIdDao<InterviewEntity> getEntityWithIdDao() {
	return interDao;
    }

    @Test
    public void testGetInterviewsByUser() {
	UserEntity interviewAuthor = new UserEntity();
	interviewAuthor = userDao.save(interviewAuthor);
	InterviewEntity interview1 = new InterviewEntity();
	InterviewEntity interview2 = new InterviewEntity();
	interview1.setUser(interviewAuthor);
	interview2.setUser(interviewAuthor);
	interDao.save(interview1);
	interDao.save(interview2);
	// When
	List<InterviewEntity> list = interDao.getInterviewsByUser(interviewAuthor);
	// Then
	assertEquals(2, list.size());
	assertEquals(interviewAuthor, list.get(0).getUser());
	assertEquals(interviewAuthor, list.get(1).getUser());
    }

}