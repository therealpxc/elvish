package edit

// Mode is an editor mode.
type Mode interface {
	Mode() ModeType
	ModeLine(width int) *buffer
}

type ModeType int

const (
	modeInsert ModeType = iota
	modeCommand
	modeCompletion
	modeNavigation
	modeHistory
	modeHistoryListing
	modeLocation
)

// Lister is a mode with a listing.
type Lister interface {
	List(width, maxHeight int) *buffer
}
