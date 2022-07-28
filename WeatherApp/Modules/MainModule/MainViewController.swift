//
//  ListTVC.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 26/07/22.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    private var selectedIndexPath: IndexPath?
    private var viewModel: MainViewModelProtocol! {
        didSet {
            spinnerView.startAnimating()
            viewModel.fetchWeatherData {
                self.animateTableView()
                self.spinnerView.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        viewModel = MainViewModel()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func animateTableView() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
            UIView.animate(withDuration: 1.5,
                           delay: 0.2,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                cell.transform = CGAffineTransform.identity
            },
                           completion: nil)
        }
    }
}

//MARK: - Extension UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCities()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.viewModelForCell(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        detailVC.viewModel = viewModel.viewModelForDetailVC(for: indexPath)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

