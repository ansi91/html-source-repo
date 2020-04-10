package project.restaurant;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RestaurantDaoTest {

	@Test
	void testProcRestList() {
		RestaurantDao rDao = new RestaurantDao();
		assertEquals(6, rDao.procRestList().size());
	}

}
