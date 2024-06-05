//
//  QuizzlerViewController.swift
//  Quizzler
//
//  Created by Дмитрий Лубов on 04.06.2024.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

enum Quizzler {

	enum Color {
		static let darkBlue = "Dark-blue"
		static let pink = "Custom-pink"
	}

	enum Image {
		static let bubblesName = "Background-Bubbles"
		static let rectangleName = "Rectangle"
	}

	enum Label {
		static let scoreText = "Score"
	}

	enum Sizes {
		static let spacing: CGFloat = 10

		enum Label {
			static let LargeFont: CGFloat = 30
			static let smallHeight: CGFloat = 40
		}

		enum Image {
			static let height: CGFloat = 102
		}

		enum Button {
			static let height: CGFloat = 80
			static let font: CGFloat = 25
		}

		enum Bar {
			static let height: CGFloat = 10
			static let radius = height / 2
		}
	}
}

final class QuizzlerViewController: UIViewController {

	// MARK: - Dependencies

	private var quizBrain: QuizBrain

	// MARK: - Private properties

	private lazy var bubblesImage: UIImageView = makeImageView()
	private lazy var mainStackView: UIStackView = makeStackView()

	private lazy var scoreLabel: UILabel = makeLabel()
	private lazy var questionLabel: UILabel = makeLabel()
	private lazy var choiceOneButton: UIButton = makeButton()
	private lazy var choiceTwoButton: UIButton = makeButton()
	private lazy var choiceThreeButton: UIButton = makeButton()
	private lazy var barProgressView: UIProgressView = makeProgressView()

	// MARK: - Initialization

	init(quizBrain: QuizBrain) {
		self.quizBrain = quizBrain
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		updateUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Private methods

	private func updateUI() {
		scoreLabel.text = "\(Quizzler.Label.scoreText): \(quizBrain.score)"
		questionLabel.text = quizBrain.getQuestion()

		let answers = quizBrain.getAnswers()
		updateButtonTitle(answers[0], for: choiceOneButton)
		updateButtonTitle(answers[1], for: choiceTwoButton)
		updateButtonTitle(answers[2], for: choiceThreeButton)

		let progress = quizBrain.getProgress()
		barProgressView.setProgress(progress, animated: true)
	}

	private func updateButtonTitle(_ title: String, for button: UIButton) {
		button.configuration?.attributedTitle = AttributedString(title)
		button.configuration?.attributedTitle?.font = .systemFont(ofSize: Quizzler.Sizes.Button.font)
	}
}

// MARK: - Actions

private extension QuizzlerViewController {

	func answerButtonPressed(_ action: UIAction) {
		guard let sender = action.sender as? UIButton, let userAnswer = sender.configuration?.title else { return }

		let result = quizBrain.checkAnswer(userAnswer)
		quizBrain.nextQuestion()

		sender.configuration?.background.backgroundColor = result ? .systemGreen : .systemRed

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
			sender.configuration?.background.backgroundColor = .clear
			self?.updateUI()
		}
	}
}

// MARK: - Setup UI

private extension QuizzlerViewController {

	func setupUI() {
		view.backgroundColor = UIColor(named: Quizzler.Color.darkBlue)

		addSubviews()

		setupQuestionLabel()
	}

	func makeImageView() -> UIImageView {
		let element = UIImageView()

		element.image = UIImage(named: Quizzler.Image.bubblesName)
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeStackView() -> UIStackView {
		let element = UIStackView()

		element.axis = .vertical
		element.distribution = .fillProportionally
		element.spacing = Quizzler.Sizes.spacing
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeLabel() -> UILabel {
		let element = UILabel()

		element.textColor = .white
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeButton() -> UIButton {
		let element = UIButton()

		element.configuration = .plain()
		element.configuration?.baseForegroundColor = .white
		element.configuration?.background.image = UIImage(named: Quizzler.Image.rectangleName)
		element.configuration?.cornerStyle = .large
		element.addAction(UIAction(handler: answerButtonPressed), for: .touchUpInside)
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeProgressView() -> UIProgressView {
		let element = UIProgressView()

		element.progressViewStyle = .bar
		element.progressTintColor = UIColor(named: Quizzler.Color.pink)
		element.trackTintColor = .white
		element.layer.cornerRadius = Quizzler.Sizes.Bar.radius
		element.clipsToBounds = true
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}
}

// MARK: - Setting UI

private extension QuizzlerViewController {

	func addSubviews() {
		view.addSubview(bubblesImage)
		view.addSubview(mainStackView)

		mainStackView.addArrangedSubview(scoreLabel)
		mainStackView.addArrangedSubview(questionLabel)
		mainStackView.addArrangedSubview(choiceOneButton)
		mainStackView.addArrangedSubview(choiceTwoButton)
		mainStackView.addArrangedSubview(choiceThreeButton)
		mainStackView.addArrangedSubview(barProgressView)
	}

	func setupQuestionLabel() {
		questionLabel.font = .systemFont(ofSize: Quizzler.Sizes.Label.LargeFont, weight: .bold)
		questionLabel.numberOfLines = 0
	}
}

// MARK: - Layout UI

private extension QuizzlerViewController {

	func layout() {
		NSLayoutConstraint.activate([
			bubblesImage.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Image.height),
			bubblesImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			bubblesImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			bubblesImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

			scoreLabel.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Label.smallHeight),

			choiceOneButton.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Button.height),
			choiceTwoButton.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Button.height),
			choiceThreeButton.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Button.height),

			barProgressView.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Bar.height)
		])
	}
}

#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			QuizzlerViewController(quizBrain: QuizBrain(questions: QuestionRepository().getQuestions())).previw()
		}
	}
}

extension UIViewController {
	struct Preview: UIViewControllerRepresentable {
		let viewController: UIViewController
		
		func makeUIViewController(context: Context) -> some UIViewController {
			viewController
		}
		
		func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
	}
	
	func previw() -> some View {
		Preview(viewController: self).edgesIgnoringSafeArea(.all)
	}
}
#endif
