

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

   
    var sidebarView: SidebarView!
    var blackScreen: UIView!
 
    var mainActivityIndicator : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x:100 ,y:200, width:80, height: 80)) as UIActivityIndicatorView
  
    
    let myWebView : UIWebView = {
        var wv = UIWebView()
       wv = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
        return wv
    }()
//    let logoImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = #imageLiteral(resourceName: "logo")
//        return imageView
//
//    }()
//
    func setupViews() {
        
        let btnMenu1 = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handelBackButton))
        self.navigationItem.rightBarButtonItem = btnMenu1
        
        
        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(btnMenuAction) )
        btnMenu.tintColor=UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = btnMenu
        
        sidebarView=SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sidebarView.delegate=self

        sidebarView.layer.zPosition=100
        self.view.isUserInteractionEnabled=true
        self.navigationController?.view.addSubview(sidebarView)
        
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.backgroundColor=UIColor(white: 0, alpha: 0.5)
        blackScreen.isHidden=true
        self.navigationController?.view.addSubview(blackScreen)
        blackScreen.layer.zPosition=99
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }
    func setupWebView(url: URL) {
        self.view.addSubview(myWebView)
        let myURLRequest:URLRequest = URLRequest(url: url)
        myWebView.delegate = self
        myWebView.loadRequest(myURLRequest)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        mainActivityIndicator.stopAnimating()
        
    }
    func webViewDidStartLoad(_ webView: UIWebView){
        mainActivityIndicator.startAnimating()
    }

    func loading() {
        mainActivityIndicator.center = self.view.center
        mainActivityIndicator.hidesWhenStopped = true
        mainActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        mainActivityIndicator.color = UIColor.darkGray
        mainActivityIndicator.startAnimating()
        self.view.addSubview(mainActivityIndicator)
    }
    
    var window: UIWindow?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // myWebView.addSubview(logoImage)
       // logoImage.frame = CGRect(x: self.view.frame.width / 4, y: self.view.frame.height / 3.5, width: 200, height: 100)
     //   window?.addSubview(logoImage)
       // window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v0(60)]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": logoImage]))
       // window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v0(80)]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": logoImage]))
        let myURL = URL(string: "http://m.jetcompare.com.au/")
        setupWebView(url: myURL!)
        setupWebApp()
        
    }
    func setupWebApp() {
    
        loading()
        setupViews()
        
    }
    
    
    @objc func handelBackButton() {
        
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
  
    
    @objc func btnMenuAction() {
        blackScreen.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 250, height: self.sidebarView.frame.height)
        }) { (complete) in
            self.blackScreen.frame=CGRect(x: self.sidebarView.frame.width, y: 0, width: self.view.frame.width-self.sidebarView.frame.width, height: self.view.bounds.height+100)
        }
    }
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
    }

}

extension ViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
        switch row {
        case .editProfile:
            self.navigationController?.pushViewController(EditProfileVC(), animated: true)
        case .home:
            self.navigationController?.pushViewController(messagesController(), animated: true)
        case .flights:
            self.navigationController?.pushViewController(contactController(), animated: true)
        case .hotels:
            self.navigationController?.pushViewController(settingController(), animated: true)
        case .cars:
            self.navigationController?.pushViewController(carsController(), animated: true)
        case .about_us:
             self.navigationController?.pushViewController(aboutUsController(), animated: true)
        case .contact_us:
            self.navigationController?.pushViewController(contactUsController(), animated: true)
        case .none:
            break
            //        default:  //Default will never be executed
            //            break
        }
    }
    
   
    
}
