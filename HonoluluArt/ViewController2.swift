
import UIKit
import WebKit
import Foundation
		
class ViewController2: UIViewController,WKNavigationDelegate,UISearchBarDelegate    {
    
    
    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.google.com")

        let request = URLRequest(url: url!)
        webView.load(request)
        webView.addSubview(activity)
        activity.startAnimating()
        webView.navigationDelegate = self
        activity.hidesWhenStopped = true
    }
    
    @IBAction func back(_ sender: Any) {
        
       if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forword(_ sender: Any) {
        if webView.canGoForward {
             webView.goForward()
         }
    }
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
        
        
    }
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activity.startAnimating()
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activity.stopAnimating()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let url = URL(string: "http://\(searchBar.text!)")
        let request = URLRequest(url: url!)
      webView.load(request)


    }
}


