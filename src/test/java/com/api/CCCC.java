package com.api;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Test;

public class CCCC {
	
	 @Test
   void testParallel() {
    	Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/features");
		aRunner.parallel(5);
		
     
	 }
	 
	 private void generateReport(String karateOutputPath) {
	    	
	       
         Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath) , new String[]{"json"}, true);
         List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
         jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
         Configuration config = new Configuration(new File("target"), "KarateBaseFramework");
         ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
         reportBuilder.generateReports();
         
      
	 }
}
