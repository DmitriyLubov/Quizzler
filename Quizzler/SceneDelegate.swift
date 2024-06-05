//
//  SceneDelegate.swift
//  Quizzler
//
//  Created by Дмитрий Лубов on 04.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = QuizzlerViewController(quizBrain: buildQuizBrain())
		window.makeKeyAndVisible()

		self.window = window
	}
}

private extension SceneDelegate {

	func buildQuizBrain() -> QuizBrain {
		let repository: IQuestionRepository = QuestionRepository()
		return QuizBrain(questions: repository.getQuestions())
	}
}
