import UIKit


enum ContentElement {
    case label(String)
    case button(String) // TODO: Add an action
    case image(UIImage)
}

extension ContentElement {
    var view: UIView {
        switch self {
        case .label(let text):
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            return label
        case .button(let title):
            let button = UIButton(type: .System)
            button.setTitle(title, forState: .Normal)
            return button
        case .image(let image):
            return UIImageView(image: image)
        }
    }
}


final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .Vertical
        stack.spacing = 10
        view.addSubview(stack)
        
        stack.constrainEqual(.Width, to: view)
        stack.center(in: view)
        
        let image = ContentElement.image([#Image(imageLiteral: "objc-logo-white.png")#]).view
        stack.addArrangedSubview(image)
        
        let text1 = ContentElement.label("To use the Swift Talk app please login as a subscriber").view
        stack.addArrangedSubview(text1)
        
        let button = ContentElement.button("Login with GitHub").view
        stack.addArrangedSubview(button)
        
        let text2 = ContentElement.label("If you're not registered yet, please visit http://objc.io for more information").view
        stack.addArrangedSubview(text2)
    }
}


let vc = ViewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view


