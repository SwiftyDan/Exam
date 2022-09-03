//
//  SearchVC.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit

class SearchVC: BaseViewController {

    // MARK: - Properties
    private var searchText = ""
    private var searchResult: [Recipe]?
    private var refreshControl = UIRefreshControl()
    private var searchCode = ""
    private var page = 1
    private var blankData = false
    private var pages = ["dsds","dasdasdas","WHAT"]
    // MARK: - UI Component
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.barTintColor = .white
        search.backgroundColor = .white
        search.layer.borderColor = .rgb(226)
        search.layer.borderWidth = 1
        search.setImage(UIImage(named: "icoSearch"), for: .search, state: .normal)
        search.placeholder = "Search here"
        
        let textFeild = search.value(forKey: "searchField") as? UITextField
        textFeild?.font = UIFont.godo_M(15)
        textFeild?.textColor = .black
        textFeild?.backgroundColor = .white
        
        let placeholder = textFeild?.value(forKey: "placeholderLabel") as? UILabel
        placeholder?.font = UIFont.godo_M(15)
        placeholder?.textColor = .rgb(185)
        
        return search
    }()
    private let searchResultTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(cellType: SearchCell.self)
        let view = UIView()
        view.backgroundColor = .rgb(245)
        tableView.tableFooterView = view
        return tableView
    }()
    
    // MARK: - Override
    init(text: String? = nil, searchResult: [Recipe]? = nil, searchCode: String) {
        super.init(nibName: nil, bundle: nil)
        self.searchText = text ?? ""
        self.searchResult = searchResult
        self.searchCode = searchCode
        if text != "" {
            self.getInfo(searchText: text!, page: 1)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        view.addSubview(searchBar)
        view.addSubview(searchResultTableView)
        layout()
    }

    // MARK: - Private Method
    private func initialSetting() {
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow, title: "Search Recipe")
        showBackButton()
        view.backgroundColor = .rgb(245)
        
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self
        searchBar.delegate = self
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl.tintColor = .rgb(158)
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh TableView View", attributes: [.font:UIFont.godo_M(13), .foregroundColor: UIColor.rgb(158)])
             
        if #available(iOS 10.0, *) {
            searchResultTableView.refreshControl = refreshControl
        } else {
            searchResultTableView.addSubview(refreshControl)
        }
        
        searchBar.text = searchText == " " ? nil:searchText
        
    }
    
    // MARK: - Network
    private func getInfo(searchText: String, page: Int) {
        self.showSpinner(onView: self.view)
        HomeService().getSearchResultMart(searchText: searchText){ [weak self] (result, errorStr, error) in
            guard let self = self else {return}
            guard let result = result, errorStr == nil else{
                self.alert("\(errorStr ?? "")")
                self.removeSpinner()
                return
            }
          
            //let sortedDic = Dictionary(grouping: result, by: {$0.comp_se})
            //let categoryDic = sortedDic[self.searchCode]
            self.searchResult = result
            self.blankData = false
            self.removeSpinner()
            self.searchResultTableView.reloadData()
            
        }
    }
    
    private func addData(searchText: String) {

    }
    
    // MARK: - Selector
    @objc func refreshData() {
        page = 1
        getInfo(searchText: searchText, page: page)
        refreshControl.endRefreshing()
    }
    
    
}
// MARK: - Layout
extension SearchVC {
    private func layout() {
        let margins = view.safeAreaLayoutGuide
        
        searchBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 12).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        searchResultTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        searchResultTableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        searchResultTableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        searchResultTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
    }
}


// MARK: - UITableViewDataSource
extension SearchVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let arr = self.searchResult else{return 0}
        let count = arr.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SearchCell.self)
        guard let row = searchResult?[indexPath.row] else{return cell}
        cell.configure(row)
        return cell
    }
}


// MARK: - UITableViewDelegate
extension SearchVC: UITableViewDelegate {
   
 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = searchResult?[indexPath.row] else{return}
        
        let vc = DetailsViewController(row)
        show(vc)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let height: CGFloat = scrollView.frame.size.height
        let contentYOffset: CGFloat = scrollView.contentOffset.y
        let scrollViewHeight: CGFloat = scrollView.contentSize.height
        let distanceFromBottom: CGFloat = scrollViewHeight - contentYOffset
                
        if distanceFromBottom < height {
            if self.blankData == false {
                self.addData(searchText: self.searchText)
            }
        }
    }
}


// MARK: - UISearchBarDelegate
extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchWord = searchBar.text else{return}
        guard var recent = recentSearchWordx else{
            var recentArray = [String]()
            recentArray.append(searchWord)
            recentSearchWordx = recentArray
            getInfo(searchText: searchWord, page: page)
            return
        }
        if recent.contains(searchWord) {
            guard let index = recent.firstIndex(of: searchWord) else{return}
            recent.remove(at: index)
            recent.insert(searchWord, at: 0)
            recentSearchWordx = recent
            getInfo(searchText: searchWord, page: page)
        } else {
            if recent.count >= 5 {
                recent.removeLast()
                recent.insert(searchWord, at: 0)
                recentSearchWordx = recent
                getInfo(searchText: searchWord, page: page)
            } else {
                recent.insert(searchWord, at: 0)
                recentSearchWordx = recent
                getInfo(searchText: searchWord, page: page)
            }
        }
        self.searchText = searchWord
 

    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.text = nil
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
