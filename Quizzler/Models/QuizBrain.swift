//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Дмитрий Лубов on 05.06.2024.
//

struct QuizBrain {

	private let questions: [Question]
	private var questionNumber = 1

	init(questions: [Question]) {
		self.questions = questions
	}

	func getQuestion() -> String {
		questions[questionNumber - 1].content
	}

	func checkAnswer(_ userAnswer: String) -> Bool {
		userAnswer == questions[questionNumber - 1].answer
	}

	func getProgress() -> Float {
		Float(questionNumber) / Float(questions.count)
	}

	mutating func nextQuestion() {
		if questionNumber < questions.count {
			questionNumber += 1
		} else {
			questionNumber = 1
		}
	}
}
