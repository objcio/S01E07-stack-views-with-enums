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


extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .Vertical
        spacing = 10
        
        for element in elements {
            addArrangedSubview(element.view)
        }
    }
}


final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()

        let image = ContentElement.image([#Image(imageLiteral: "objc-logo-white.png")#])
        
        let text1 = ContentElement.label("To use the Swift Talk app please login as a subscriber")
        
        let button = ContentElement.button("Login with GitHub")
        
        let text2 = ContentElement.label("If you're not registered yet, please visit http://objc.io for more information")

        let stack = UIStackView(elements: [image, text1, button, text2])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .Vertical
        stack.spacing = 10
        view.addSubview(stack)
        
        stack.constrainEqual(.Width, to: view)
        stack.center(in: view)
    }
}


let vc = ViewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view


