//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Дмитрий Лубов on 05.06.2024.
//

struct QuizBrain {

	private let questions: [Question]
	private var questionNumber = 1
	private(set) var score = 0

	init(questions: [Question]) {
		self.questions = questions
	}

	func getQuestion() -> String {
		questions[questionNumber - 1].content
	}

	mutating func checkAnswer(_ userAnswer: String) -> Bool {
		let result = userAnswer == questions[questionNumber - 1].answer
		score += result ? 1 : 0

		return result
	}

	func getProgress() -> Float {
		Float(questionNumber) / Float(questions.count)
	}

	mutating func nextQuestion() {
		if questionNumber < questions.count {
			questionNumber += 1
		} else {
			questionNumber = 1
			score = 0
		}
	}
}
