//
//  QuestionRepository.swift
//  Quizzler
//
//  Created by Дмитрий Лубов on 05.06.2024.
//

protocol IQuestionRepository {

	func getQuestions() -> [Question]
}

final class QuestionRepository: IQuestionRepository {

	func getQuestions() -> [Question] {
		[
			Question(
				content: "Which is the largest organ in the human body?",
				answers: ["Heart", "Skin", "Large Intestine"],
				correctAnswer: "Skin"
			),
			Question(
				content: "Five dollars is worth how many nickels?",
				answers: ["25", "50", "100"],
				correctAnswer: "100"
			),
			Question(
				content: "What do the letters in the GMT time zone stand for?",
				answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
				correctAnswer: "Greenwich Mean Time"
			),
			Question(
				content: "What is the French word for 'hat'?",
				answers: ["Chapeau", "Écharpe", "Bonnet"],
				correctAnswer: "Chapeau"
			),
			Question(
				content: "In past times, what would a gentleman keep in his fob pocket?",
				answers: ["Notebook", "Handkerchief", "Watch"],
				correctAnswer: "Watch"
			),
			Question(
				content: "How would one say goodbye in Spanish?",
				answers: ["Au Revoir", "Adiós", "Salir"],
				correctAnswer: "Adiós"
			),
			Question(
				content: "Which of these colours is NOT featured in the logo for Google?",
				answers: ["Green", "Orange", "Blue"],
				correctAnswer: "Orange"
			),
			Question(
				content: "What alcoholic drink is made from molasses?",
				answers: ["Rum", "Whisky", "Gin"],
				correctAnswer: "Rum"
			),
			Question(
				content: "What type of animal was Harambe?",
				answers: ["Panda", "Gorilla", "Crocodile"],
				correctAnswer: "Gorilla"
			),
			Question(
				content: "Where is Tasmania located?",
				answers: ["Indonesia", "Australia", "Scotland"],
				correctAnswer: "Australia"
			)
		]
	}
}
