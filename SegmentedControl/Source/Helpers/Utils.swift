import UIKit

class Utils {

    static func showActivityIndicator(view: UIView, targetVC: UIViewController) {

        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.7)
        activityIndicator.color = .white
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = targetVC.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.tag = 1
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    static func hideActivityIndicator(view: UIView) {
        let activityIndicator = view.viewWithTag(1) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }

}
