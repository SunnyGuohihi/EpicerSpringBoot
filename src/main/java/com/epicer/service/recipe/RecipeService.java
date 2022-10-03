package com.epicer.service.recipe;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.recipe.Ingredients;
import com.epicer.model.recipe.Recipe;
import com.epicer.model.recipe.Step;


@Service @Transactional
public class RecipeService {
	@Autowired
	private RecipeRepository recipeRepository;
	@Autowired
	private IngredientRepository ingredientRepository;
	@Autowired
	private StepRepository stepRepository;
	
	public void addRecipe(Recipe recipeBean,Set<Ingredients> ingredientsSet, Set<Step> stepSet) {
		Iterator<Ingredients> iterator = ingredientsSet.iterator();
		while(iterator.hasNext()) {
			Ingredients ingredientsBean = iterator.next();
			ingredientsBean.setRecipeBean(recipeBean);
		}
		Iterator<Step> stepIterator = stepSet.iterator();
		while(stepIterator.hasNext()) {
			Step step = stepIterator.next();
			step.setRecipeBean(recipeBean);
		}
		recipeBean.setIngredients(ingredientsSet);
		recipeBean.setSteps(stepSet);
		recipeRepository.save(recipeBean);
	}
	public void deleteRecipe(Integer id) {
		recipeRepository.deleteById(id);
	}
	
	public List<Recipe> queryAll(){
		return recipeRepository.findAll();
	}
	
	public List<Recipe> queryByName(String name){
		System.out.println(name);
		List<Recipe> queryByRecipeName = recipeRepository.queryByRecipeName(name);
		System.out.println(queryByRecipeName.size());
		return queryByRecipeName;
	}
	
	public Recipe queryById(Integer id) {
		return recipeRepository.getReferenceById(id);
	}
	public List<Ingredients> queryIngredientsByRecipeId(Integer id){
		return	ingredientRepository.queryIngredientsByRecipeId(id);
	}
	public List<Step> queryStepsByRecipeId(Integer id){
		return stepRepository.queryStepsByRecipeId(id);
	}
	
	public List<Recipe> queryByUserId(Integer userId){
		return recipeRepository.queryByUserId(userId);
	}
	}
	
	

