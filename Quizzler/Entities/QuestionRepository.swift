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
			Question(content: "A slug's blood is green.", answer: true.description.capitalized),
			Question(
				content: "Approximately one quarter of human bones are in the feet.",
				answer: true.description.capitalized
			),
			Question(
				content: "The total surface area of two human lungs is approximately 70 square metres.",
				answer: true.description.capitalized
			),
			Question(
				content: """
					 In West Virginia, USA, if you accidentally hit an animal with your car, \
					 you are free to take it home to eat.
					 """,
				answer: true.description.capitalized
			),
			Question(
				content: """
					 In London, UK, if you happen to die in the House of Parliament, you are technically entitled \
					 to a state funeral, because the building is considered too sacred a place.
					 """,
				answer: false.description.capitalized
			),
			Question(content: "It is illegal to pee in the Ocean in Portugal.", answer: true.description.capitalized),
			Question(
				content: "You can lead a cow down stairs but not up stairs.",
				answer: false.description.capitalized
			),
			Question(content: "Google was originally called 'Backrub'.", answer: true.description.capitalized),
			Question(content: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: true.description.capitalized),
			Question(
				content: """
					The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.
					""",
				answer: false.description.capitalized
			),
			Question(
				content: "No piece of square dry paper can be folded in half more than 7 times.",
				answer: false.description.capitalized
			),
			Question(
				content: """
					Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.
					""",
				answer: true.description.capitalized
			)
		]
	}
}
