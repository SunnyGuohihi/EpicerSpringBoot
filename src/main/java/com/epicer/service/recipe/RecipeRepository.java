package com.epicer.service.recipe;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.epicer.model.recipe.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Integer> {
	@Query(value = "from Recipe where recipeName like concat('%',?1,'%') ")
	public List<Recipe> queryByRecipeName(String recipeName);

	@Query(value = "select * from recipe where userid  = :id", nativeQuery = true)
	public List<Recipe> queryByUserId(@Param("id") Integer userId);
}
