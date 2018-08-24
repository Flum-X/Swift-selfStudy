//
//  MasterTableViewController.swift
//  SwiftProject7
//
//  Created by DaXiong on 2018/8/22.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol PokemonSelectionDelegate: class {
    func pokemonSelected(_ newPokemon: Pokemon)
}

class MasterTableViewController: UITableViewController {
    var pokemons = LibraryAPI.shareInstance.getPokemons()
    var filteredPokemons = [Pokemon]()
    weak var delegate: PokemonSelectionDelegate?
    
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        filteredPokemons = pokemons
    }
    
    fileprivate func setupUI() {
        self.title = "精灵列表"
        
        definesPresentationContext = true
        
        searchBar
            .rx.text
            .throttle(0.5, scheduler: MainScheduler.instance)
            .subscribe(
                onNext: { [unowned self] query in
                    if query?.characters.count == 0 {
                        self.filteredPokemons = self.pokemons
                    } else {
                        self.filteredPokemons = self.pokemons.filter{ $0.name.hasPrefix(query!) }
                    }
                    self.tableView.reloadData()
            })
        .addDisposableTo(disposeBag)
    }
    
    func dissmissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let pokemon = self.filteredPokemons[(indexPath as NSIndexPath).row]
        
        delegate?.pokemonSelected(pokemon)
        
        if let detailVC = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailVC.navigationController!, sender: nil)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MasterTableViewCell
        let pokemon = filteredPokemons[(indexPath as NSIndexPath).row]
        
        cell.awakeFromNib(pokemon.id, name: pokemon.name, pokeImageUrl: pokemon.pokeImgUrl)
        
        return cell
    }
}
