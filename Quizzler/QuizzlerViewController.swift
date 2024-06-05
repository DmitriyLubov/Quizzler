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

	enum Sizes {
		static let spacing: CGFloat = 10

		enum Label {
			static let font: CGFloat = 30
		}

		enum Image {
			static let height: CGFloat = 102
		}

		enum Button {
			static let height: CGFloat = 80
		}

		enum Bar {
			static let height: CGFloat = 10
			static let radius = height / 2
		}
	}
}

final class QuizzlerViewController: UIViewController {
	
	// MARK: - Outlets
	
	// MARK: - Public properties
	
	// MARK: - Dependencies
	
	// MARK: - Private properties

	private lazy var bubblesImage: UIImageView = makeImageView()
	private lazy var mainStackView: UIStackView = makeStackView()

	private lazy var questionLabel: UILabel = makeLabel()
	private lazy var trueButton: UIButton = makeButton()
	private lazy var falseButton: UIButton = makeButton()
	private lazy var barProgressView: UIProgressView = makeProgressView()

	// MARK: - Initialization
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Public methods
	
	// MARK: - Private methods
}

// MARK: - Actions

private extension QuizzlerViewController {

	func answerButtonPressed(_ action: UIAction) {
		
	}
}

// MARK: - Setup UI

private extension QuizzlerViewController {

	func setupUI() {
		view.backgroundColor = UIColor(named: Quizzler.Color.darkBlue)

		addSubviews()

		setupTrueButton()
		setupFalseButton()
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
		element.spacing = Quizzler.Sizes.spacing
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeLabel() -> UILabel {
		let element = UILabel()

		element.textColor = .white
		element.font = .systemFont(ofSize: Quizzler.Sizes.Label.font, weight: .bold)
		element.numberOfLines = 0
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

		mainStackView.addArrangedSubview(questionLabel)
		mainStackView.addArrangedSubview(trueButton)
		mainStackView.addArrangedSubview(falseButton)
		mainStackView.addArrangedSubview(barProgressView)
	}

	func setupTrueButton() {
		trueButton.configuration?.attributedTitle = AttributedString(true.description.capitalized)
		trueButton.configuration?.attributedTitle?.font = .systemFont(ofSize: 25)
	}

	func setupFalseButton() {
		falseButton.configuration?.attributedTitle = AttributedString(false.description.capitalized)
		falseButton.configuration?.attributedTitle?.font = .systemFont(ofSize: 25)
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

			trueButton.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Button.height),
			falseButton.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Button.height),

			barProgressView.heightAnchor.constraint(equalToConstant: Quizzler.Sizes.Bar.height)
		])
	}
}

#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			QuizzlerViewController().previw()
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
