//
//  ViewController.swift
//  coupang
//
//  Created by 강창혁 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainStackV: UIStackView!
    @IBOutlet weak var mainScrollV: UIScrollView!
    @IBOutlet weak var pageControlStackV: UIStackView!
    @IBOutlet weak var pageControlV: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlScrollV: UIScrollView!
    @IBOutlet weak var tabbaritem: UITabBarItem!
    
    var images = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","0.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupPageControlScrollView()
        setupPageControl()
    }
    
    func setupSearchBar() {
        searchBar.layer.borderWidth = 0.5
        searchBar.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        
        searchBar.placeholder = "쿠팡에서 검색하세요!"
        searchBar.searchTextField.layer.borderColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        searchBar.searchTextField.layer.borderWidth = 1
        searchBar.searchTextField.layer.cornerRadius = 4
        searchBar.searchTextField.backgroundColor = .white
    }
    
    func setupPageControlScrollView() {
        for i in 0..<images.count {
            let xPosition = pageControlStackV.frame.width / CGFloat(10) * CGFloat(i)
            let rect: CGRect = .init(x: xPosition, y: 0, width: pageControlV.frame.width, height: pageControlV.frame.height)
            let ImageV: UIImageView = .init(frame: rect)
            ImageV.image = UIImage(named: "\(images[i])")
            ImageV.contentMode = .scaleToFill
            
            pageControlStackV.addSubview(ImageV)

        }
        pageControlScrollV.delegate = self
    }
    func setupPageControl() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = images.count
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .lightGray
        
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / pageControlScrollV.bounds.width)
    }
}

