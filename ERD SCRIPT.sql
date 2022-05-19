-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`player_overviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`player_overviews` (
  `player_slug` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `player_url` VARCHAR(75) NULL,
  `flag_code` CHAR(3) NULL,
  `residence` VARCHAR(45) NULL,
  `birthplace` VARCHAR(45) NULL,
  `birthdate` INT NULL,
  `birth_year` INT NULL,
  `birth_month` INT NULL,
  `birth_day` VARCHAR(45) NULL,
  `turned_pro` VARCHAR(45) NULL,
  `weight_lbs` VARCHAR(45) NULL,
  `weight_kg` VARCHAR(45) NULL,
  `height_ft` VARCHAR(45) NULL,
  `height_inches` VARCHAR(45) NULL,
  `heigth_cm` VARCHAR(45) NULL,
  `handedness` VARCHAR(45) NULL,
  `backhand` VARCHAR(45) NULL,
  `player_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tourney`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tourney` (
  `tourney_year_id` CHAR(8) NOT NULL,
  `tourney_year` INT(4) NULL,
  `tourney_order` INT NULL,
  `tourney_name` VARCHAR(45) NULL,
  `tourney_slug` VARCHAR(45) NULL,
  `tourney_location` VARCHAR(45) NULL,
  `tourney_dates` DATETIME NULL,
  `tourney_month` INT NULL,
  `tourney_day` INT NULL,
  `tourney_singles_draw` INT NULL,
  `tourney_doubles_draw` INT NULL,
  `tourney_conditions` VARCHAR(45) NULL,
  `tourney_surface` VARCHAR(45) NULL,
  `tourney_fin_commit` VARCHAR(45) NULL,
  `tourney_url_suffix` VARCHAR(75) NULL,
  `singles_winner_name` VARCHAR(45) NULL,
  `singles_winner_url` VARCHAR(75) NULL,
  `singles_winner_player_slug` VARCHAR(45) NULL,
  `singles_winner_player_id` CHAR(4) NULL,
  `doubles_winner_name` VARCHAR(45) NULL,
  `doubles_winner_1_url` VARCHAR(75) NULL,
  `doubles_winner_1_player_slug` VARCHAR(45) NULL,
  `doubles_winner_1_player_id` CHAR(4) NULL,
  `doubles_winner_2_name` VARCHAR(45) NULL,
  `doubles_winner_2_url` VARCHAR(75) NULL,
  `doubles_winner_2_player_slug` VARCHAR(45) NULL,
  `doubles_winner_2_player_id` CHAR(4) NULL,
  PRIMARY KEY (`tourney_year_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`match_scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`match_scores` (
  `tourney_slug` VARCHAR(45) NULL,
  `tourney_url_suffix` VARCHAR(75) NULL,
  `tourney_round_name` VARCHAR(45) NULL,
  `round_order` INT NULL,
  `match_order` INT NULL,
  `winner_name` VARCHAR(45) NULL,
  `winner_player_id` CHAR(4) NULL,
  `winner_slug` VARCHAR(45) NULL,
  `loser_name` VARCHAR(45) NULL,
  `loser_player_id` CHAR(4) NULL,
  `loser_slug` VARCHAR(45) NULL,
  `winner_seed` INT NULL,
  `match_score_tiebreaks` VARCHAR(45) NULL,
  `winner_sets_won` INT NULL,
  `loser_sets_won` INT NULL,
  `winner_games_won` INT NULL,
  `loser_games_won` INT NULL,
  `winner_tiebreaks_won` INT NULL,
  `loser_tiebreaks_won` INT NULL,
  `match_id` VARCHAR(45) NOT NULL,
  `player_overviews_player_id` VARCHAR(45) NOT NULL,
  `tourney_tourney_year_id` CHAR(8) NOT NULL,
  PRIMARY KEY (`match_id`),
  INDEX `fk_match_scores_player_overviews1_idx` (`player_overviews_player_id` ASC) VISIBLE,
  INDEX `fk_match_scores_tourney1_idx` (`tourney_tourney_year_id` ASC) VISIBLE,
  CONSTRAINT `fk_match_scores_player_overviews1`
    FOREIGN KEY (`player_overviews_player_id`)
    REFERENCES `mydb`.`player_overviews` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_scores_tourney1`
    FOREIGN KEY (`tourney_tourney_year_id`)
    REFERENCES `mydb`.`tourney` (`tourney_year_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`match_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`match_stats` (
  `winner_player_id` CHAR(4) NULL,
  `winner_aces` INT NULL,
  `winner_double_faults` INT NULL,
  `winner_first_serve_in` INT NULL,
  `winner_first_serve_total` INT NULL,
  `winner_first_serve_points_won` INT NULL,
  `winner_second_serve_points_won` INT NULL,
  `winner_second_serve_points_total` INT NULL,
  `winner_break_points_serve_total` INT NULL,
  `winner_service_points_total` INT NULL,
  `winner_first_serve_return_won` INT NULL,
  `winner_first_serve_return_total` INT NULL,
  `winner_break_points_saved` INT NULL,
  `winner_break_points_total` INT NULL,
  `winner_second_serve_return_won` INT NULL,
  `winner_second_serve_return_total` INT NULL,
  `winner_break_points_return_total` INT NULL,
  `winner_service_games_played` INT NULL,
  `winner_return_games_played` INT NULL,
  `winner_return_points_won` INT NULL,
  `winner_return_points_total` INT NULL,
  `winner_total_points_won` INT NULL,
  `winner_total_points_total` INT NULL,
  `loser_aces` INT NULL,
  `loser_double_faults` INT NULL,
  `loser_first_serves_in` INT NULL,
  `loser_first_serves_total` INT NULL,
  `loser_first_serve_points_won` INT NULL,
  `loser_first_serve_points_total` INT NULL,
  `loser_second_serve_points_won` INT NULL,
  `loser_second_serve_points_total` INT NULL,
  `loser_break_points_saved` INT NULL,
  `loser_break_points_serve_total` INT NULL,
  `loser_service_points_won` INT NULL,
  `loser_service_points_total` INT NULL,
  `loser_first_serve_return_won` INT NULL,
  `loser_first_serve_return_total` INT NULL,
  `loser_second_serve_return_won` INT NULL,
  `loser_second_serve_return_total` INT NULL,
  `loser_break_points_converted` INT NULL,
  `loser_break_points_return_total` INT NULL,
  `loser_service_games_played` INT NULL,
  `loser_return_games_played` INT NULL,
  `loser_return_points_won` INT NULL,
  `loser_return_points_total` INT NULL,
  `loser_total_points_won` INT NULL,
  `loser_total_points_total` INT NULL,
  `match_stats_url_suffix` VARCHAR(75) NULL,
  `match_time` INT NULL,
  `match_duration` INT NULL,
  `match_scores_match_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`match_scores_match_id`),
  INDEX `fk_match_stats_match_scores1_idx` (`match_scores_match_id` ASC) VISIBLE,
  CONSTRAINT `fk_match_stats_match_scores1`
    FOREIGN KEY (`match_scores_match_id`)
    REFERENCES `mydb`.`match_scores` (`match_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rankings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rankings` (
  `week_title` DATETIME NOT NULL,
  `week_year` YEAR(4) NULL,
  `week_month` INT NULL,
  `week_day` INT NULL,
  `rank_text` INT NULL,
  `rank_number` INT NULL,
  `move_position` INT NULL,
  `move_direction` VARCHAR(45) NULL,
  `player_age` INT NULL,
  `ranking_points` INT NULL,
  `tourneys_played` INT NULL,
  `player_overviews_player_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`player_overviews_player_id`, `week_title`),
  INDEX `fk_rankings_player_overviews1_idx` (`player_overviews_player_id` ASC) VISIBLE,
  CONSTRAINT `fk_rankings_player_overviews1`
    FOREIGN KEY (`player_overviews_player_id`)
    REFERENCES `mydb`.`player_overviews` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
