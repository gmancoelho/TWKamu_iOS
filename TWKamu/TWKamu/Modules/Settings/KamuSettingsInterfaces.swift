//
//  KamuSettingsInterfaces.swift
//  TWKamu
//
//  Created by Guilherme Coelho on 22/08/18.
//  Copyright (c) 2018 ThoughtWorks. All rights reserved.
//
//

import UIKit

enum KamuSettingsNavigationOption {
}

protocol KamuSettingsWireframeInterface: WireframeInterface {
  func navigate(to option: KamuSettingsNavigationOption)
}

protocol KamuSettingsViewInterface: ViewInterface {
}

protocol KamuSettingsPresenterInterface: PresenterInterface {
}
