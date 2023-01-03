package com.api.features;


import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class testGetRunners {
	

	@Test
	public Karate runTest1() {

		return Karate.run("classpath:com/api/features/getAllData.feature");
	}
}
