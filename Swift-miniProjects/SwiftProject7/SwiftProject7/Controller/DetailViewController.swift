//
//  DetailViewController.swift
//  SwiftProject7
//
//  Created by DaXiong on 2018/8/22.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameIDLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeInfoLabel: UILabel!
    
    var pokemon: Pokemon! {
        didSet (newPokemon) {
            self.refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    func refreshUI() {
        nameIDLabel?.text = pokemon.name + (pokemon.id < 10 ? " #00\(pokemon.id)" : pokemon.id < 100 ? " #0\(pokemon.id)" : " #\(pokemon.id)")
        pokeImageView?.image = LibraryAPI.shareInstance.downloadImg(pokemon.pokeImgUrl)
        pokeInfoLabel?.text = pokemon.detailInfo
        
        self.title = pokemon.name
    }
}

extension DetailViewController: PokemonSelectionDelegate {
    func pokemonSelected(_ newPokemon: Pokemon) {
        pokemon = newPokemon
    }
}
