import UIKit

class MainFlowController: FlowController {
    private weak var rootNavigationController: UINavigationController!
    private var onBoardingFlow: FlowController!
    private var mapFlow: FlowController!

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func startFlow() {
        startOnboardingFlow()
    }

    private func startOnboardingFlow() {
        onBoardingFlow = OnboardingFlowController(rootNavigationController: rootNavigationController)
        onBoardingFlow.startFlow()
    }
}