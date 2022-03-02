//
//  TrailorItemCellView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import Foundation
protocol HeaderCellView
{
    func configure(itemTrailor: Trailor)
}
protocol HeaderMovement
{
    func moveToNextCell(index: Int)
}
