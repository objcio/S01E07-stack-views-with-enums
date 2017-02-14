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
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            return button
        case .image(let image):
            return UIImageView(image: image)
        }
    }
}


extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
        
        for element in elements {
            addArrangedSubview(element.view)
        }
    }
}


final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let image = ContentElement.image(#imageLiteral(resourceName: "objc-logo-white.png"))
        
        let text1 = ContentElement.label("To use the Swift Talk app please login as a subscriber")
        
        let button = ContentElement.button("Login with GitHub")
        
        let text2 = ContentElement.label("If you're not registered yet, please visit http://objc.io for more information")
        
        let stack = UIStackView(elements: [image, text1, button, text2])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        view.addSubview(stack)
        
        stack.constrainEqual(attribute: .width, to: view)
        stack.center(in: view)
    }
}


let vc = ViewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view

