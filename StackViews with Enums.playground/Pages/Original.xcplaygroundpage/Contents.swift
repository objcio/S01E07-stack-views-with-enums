import UIKit


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
        
        let image = UIImageView(image: [#Image(imageLiteral: "objc-logo-white.png")#])
        stack.addArrangedSubview(image)
        
        let text1 = UILabel()
        text1.numberOfLines = 0
        text1.text = "To use the Swift Talk app please login as a subscriber"
        stack.addArrangedSubview(text1)
        
        let button = UIButton(type: .System)
        button.setTitle("Login with GitHub", forState: .Normal)
        stack.addArrangedSubview(button)
        
        let text2 = UILabel()
        text2.numberOfLines = 0
        text2.text = "If you're not registered yet, please visit http://objc.io for more information"
        stack.addArrangedSubview(text2)
    }
}


let vc = ViewController()

vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view


