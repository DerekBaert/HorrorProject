class_name NFCatalogEntry
extends RefCounted
## An entry object for a catalog.

## The name of the entry.
var name: String = ""
## The description of the entry.
var description: String = ""
var _flags: int = 0:
	set(f):
		if _flags == 0:
			_flags = f
## Custom data assigned to this entry. It can be accessed through this member
## or directly by calling [code]MyEntry.my_custom_data[/code]
var custom_data: Dictionary[StringName, Variant] = {}


func _set(property: StringName, value: Variant) -> bool:
	if custom_data.has(property):
		if typeof(value) != TYPE_NIL:
			custom_data[property] = value
		else:
			custom_data.erase(property)
		return true
	return false


func _get(property: StringName) -> Variant:
	if custom_data.has(property):
		return custom_data[property]
	return null


## Returns if this entry is from a built-in item, or was added in programatically.
func is_custom() -> bool:
	return BitUtils.is_bit_index(_flags, 1, true)


## Returns [code]true[/code] if this entry is inside of a catalog. Catalogs,
## to prevent crashes on invalid access, will return a non-valid item when
## accessing an inexistent item.
func is_valid() -> bool:
	return BitUtils.is_bit_index(_flags, 0, true)


static func _get_flags(valid: bool, custom: bool, lock: bool) -> int:
	var flags: int = 0
	if valid:
		flags = BitUtils.set_bit_index(flags, 0, true)
	if custom:
		flags = BitUtils.set_bit_index(flags, 1, true)
	if lock:
		flags = BitUtils.set_bit_index(flags, 63, true)
	return flags
