//
//  U Xcode.swift
//  Arena v1
//
//  Created by Dude Guy  on 10/10/16.
//  Copyright © 2016 Dude Guy . All rights reserved.
//

/// Click here to jump to xcode debugging stuff
func link2xcode() {
	_=Debugging()
}

/// To ignore annoying warnings
func disregard<t>(an:t){}


/// Single-block control
func TestBlock(run_code:Bool = true,_ description:String = "",_ block: ()->() ) {
	if run_code == true {block()}
}

/// Toggles all groups on / off
func TestGroup(run_code:Bool = true,_ description:String = "",_ block: ()->() ) {
	if Debugging.code_group {block()}
}
/// Alerts to me where I need to improve my code
public struct Hotfix {	public init (_ block: ()->() ) { block() } }

/// Gives a warning witha  message to myself
struct Note {
	init(note: String) {
	}
}

/// Partition off a block and don't run it
struct DontRun {	init(code_to_not_run: ()->()) {}}

/// Encapsulate code here to avoid having to revert
struct Backup {	init(code_to_not_run: ()->()) {
}}

/// Update code here
struct Placeholder {		init(code: ()->()) {		code()	}}

/// Like TestBlock without the return
struct Tryout {	init(code: ()->()) {		code()	}}

/// Not as strong as Hotfix()
struct NeedsWork {	init(code: ()->()) {		code()	}}


