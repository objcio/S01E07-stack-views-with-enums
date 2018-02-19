import UIKit


final class CallbackButton: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    init(title: String, onTap: @escaping () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .system)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constrainEdges(to: self)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(sender: AnyObject) {
        onTap()
    }
}


enum ContentElement {
    case label(String)
    case button(String, () -> ())
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
        case .button(let title, let callback):
            return CallbackButton(title: title, onTap: callback)
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


final class StackViewController: UIViewController {
    let elements: [ContentElement]
    
    init(elements: [ContentElement]) {
        self.elements = elements
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stack = UIStackView(elements: elements)
        view.addSubview(stack)
        stack.constrainEqual(attribute: .width, to: view)
        stack.center(in: view)
    }
}


let elements: [ContentElement] = [
    .image(#imageLiteral(resourceName: "objc-logo-white.png")),
    .label("To use the Swift Talk app please login as a subscriber"),
    .button("Login with GitHub", {
        print("Button tapped")
    }),
    .label("If you're not registered yet, please visit http://objc.io for more information")
]

let vc = StackViewController(elements: elements)

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view


