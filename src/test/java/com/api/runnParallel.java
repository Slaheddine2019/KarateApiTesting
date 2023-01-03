package com.api;

import java.io.File;
import java.util.Collection;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

	import com.intuit.karate.Results;
	import com.intuit.karate.Runner;
	import static org.junit.jupiter.api.Assertions.*;
	import org.junit.jupiter.api.Test;
	public class runnParallel {
//	@Test 
//	public void executeParalele() {
//		
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/features");
//		aRunner.parallel(5);
//		
	
//	}	

	
		@Test 
		public void executeParalele() {
		   
		        Results results = Runner.path("classpath:com/api").tags("~@skipme").parallel(5);
		        assertEquals(0, results.getFailCount(), results.getErrorMessages());
		    
	
	
		    }
		
	 }


