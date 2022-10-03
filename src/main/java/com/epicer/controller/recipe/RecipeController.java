package com.epicer.controller.recipe;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.recipe.Ingredients;
import com.epicer.model.recipe.Recipe;
import com.epicer.model.recipe.Step;
import com.epicer.service.recipe.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService recipeService;
	
	@GetMapping(path = "/recipe/{userId}")
	public String queryByUserId(@PathVariable("userId") Integer userId ,Model model) {
		List<Recipe> queryByUserId = recipeService.queryByUserId(userId);
		model.addAttribute("userRecipe",queryByUserId);
	 return	"recipe/UserRecipeResult";
	}
	
	@GetMapping(path = "/recipe" )
	public String queryAll(Model model) {
		List<Recipe> queryAll = recipeService.queryAll();
		model.addAttribute("searchAll", queryAll);
		return "recipe/NewSearch";
	}
	
	@PostMapping(path = "/recipelist" )
	public String queryList(@RequestParam(value="searchByRecipe")String name ,Model model) {
		List<Recipe> queryList = recipeService.queryByName(name);
		model.addAttribute("searchResult",queryList);
		return "recipe/NewResult";
	}
	
	@GetMapping(path = "/reciperesult/{id}")
	public String queryForId(@PathVariable("id") Integer id,Model model) {
		Recipe recipe = recipeService.queryById(id);
		List<Ingredients> ingredients = recipeService.queryIngredientsByRecipeId(id);
		List<Step> steps=recipeService.queryStepsByRecipeId(id);
		model.addAttribute("recipe",recipe);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("step", steps);
		
		return "recipe/NewRecipeResult";
	}
	
	@PostMapping(path = "/recipe")
	public String addRecipe(@RequestParam("title") String name,
			@RequestParam("file1") MultipartFile mf,@RequestParam("howmanypeople") String howMany,
			@RequestParam("description") String description,@RequestParam("time") String time,
			@RequestParam("ingredient") String[] ingredients,@RequestParam("amount") String[]amounts
			,@RequestParam("step")String[] steps,@RequestParam("userId") Integer userId,Model model) throws IllegalStateException, IOException {
		String filenameString = mf.getOriginalFilename();
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir=path +"webapp/WEB-INF/resources/images";

		String fileLocalPathString = "images/"+filenameString;
		File filePath = new File(saveFileDir, filenameString);
		mf.transferTo(filePath);
		Recipe recipeBean = new Recipe(name, fileLocalPathString, description, time, howMany);
		recipeBean.setUserId(userId);
		recipeBean.setRecipeLikes(15);
		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
		for(int i=0;i<ingredients.length;i++) {
			Ingredients ingredientsBean = new Ingredients();
			ingredientsBean.setIngredient(ingredients[i]);
			ingredientsBean.setAmount(amounts[i]);
			ingredientsSet.add(ingredientsBean);
		}
		Set<Step> stepSet=new LinkedHashSet<Step>();
		for(int i=0;i<steps.length;i++) {
			Step step = new Step();
			step.setStep(steps[i]);
			stepSet.add(step);
		}
		recipeService.addRecipe(recipeBean, ingredientsSet, stepSet);
		
		return "redirect:/recipe";
	}

	
	
	@GetMapping(path = "/recipeForUpdate/{id}")
	public String beforeUpdate(@PathVariable("id") Integer id, Model model) {
		Recipe recipe = recipeService.queryById(id);
		List<Ingredients> ingredients = recipeService.queryIngredientsByRecipeId(id);
		List<Step> steps = recipeService.queryStepsByRecipeId(id);
		model.addAttribute("recipe", recipe);
		model.addAttribute("ingredients", ingredients);
		model.addAttribute("step", steps);
		
		return "recipe/Update";
	}
//	@RequestParam("file1") MultipartFile mf
	@PostMapping(path = "/recipeupdate")
	public String update(@RequestParam("id") Integer id, @RequestParam("title") String name,
			 @RequestParam("howmanypeople") String howMany,
			 @RequestParam("file1") MultipartFile mf,@RequestParam("description") String description, @RequestParam("time") String time,
			@RequestParam("ingredient") String[] ingredients, @RequestParam("amount") String[]amounts
			,@RequestParam("step") String[] steps,@RequestParam("userId") Integer userId, Model model) throws IllegalStateException, IOException {
		String filenameString = mf.getOriginalFilename();
		System.out.println(filenameString);
		String localString = this.getClass().getClassLoader().getResource("").getPath();
		String path =  localString.substring(1).replaceAll("target", "src").replaceAll("classes", "main");
		String saveFileDir=path +"webapp/WEB-INF/resources/images";

		String fileLocalPathString = "images/" + filenameString;
		System.out.println(fileLocalPathString);
		File filePath = new File(saveFileDir, filenameString);
		mf.transferTo(filePath);
		recipeService.deleteRecipe(id);
		Recipe recipeBean = new Recipe(name, fileLocalPathString, description, time, howMany);
		recipeBean.setUserId(userId);
		recipeBean.setRecipeLikes(18);
		Set<Ingredients> ingredientsSet = new LinkedHashSet<Ingredients>();
		for (int i = 0; i < ingredients.length; i++) {
			Ingredients ingredientsBean = new Ingredients();
			ingredientsBean.setIngredient(ingredients[i]);
			ingredientsBean.setAmount(amounts[i]);
			ingredientsBean.setRecipeBean(recipeBean);
			ingredientsSet.add(ingredientsBean);
		}
		Set<Step> stepSet = new LinkedHashSet<Step>();
		for (int i = 0; i < steps.length; i++) {
			Step step = new Step();
			step.setStep(steps[i]);
			step.setRecipeBean(recipeBean);
			stepSet.add(step);
		}
		recipeBean.setIngredients(ingredientsSet);
		recipeBean.setSteps(stepSet);
		recipeService.addRecipe(recipeBean, ingredientsSet, stepSet);
		return "redirect:/recipe";
	}
	
	@DeleteMapping("/recipe/{id}")
	public String remove(@PathVariable("id") Integer id,Model model) {
		
		recipeService.deleteRecipe(id);
		
		return "redirect:/recipe";
	}
	 
	
	
}
