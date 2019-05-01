Unit ClsAppConfig;

Interface

Uses xmldom, XMLDoc, XMLIntf;

Type
  IXMLComponent = Interface(IXMLNode)
    ['{8FA05220-4C97-4B9B-B34A-753ED62A2F56}']
    Function  GetSettingName : WideString;
    Procedure SetSettingName(Value : WideString);

    Function  GetSettingValue : Integer;
    Procedure SetSettingValue(Value : Integer);

    Property SettingName  : WideString Read GetSettingName  Write SetSettingName;
    Property SettingValue : Integer    Read GetSettingValue Write SetSettingValue;

  End;
  
  IXMLForm = Interface(IXMLNodeCollection)
    ['{81923E33-0860-430E-BBC4-B07EF4DDE1F6}']
    Function  GetName : WideString;
    Procedure SetName(Value : WideString);

    Function  GetWindowState : WideString;
    Procedure SetWindowState(Value : WideString);

    Function  GetX : Integer;
    Procedure SetX(Value : Integer);

    Function  GetY : Integer;
    Procedure SetY(Value : Integer);

    Function  GetW : Integer;
    Procedure SetW(Value : Integer);

    Function  GetH : Integer;
    Procedure SetH(Value : Integer);

    Function  GetComponent(Index : Integer) : IXMLComponent;

    Function Add : IXMLComponent;
    Function Insert(Const Index : Integer) : IXMLComponent;

    Property Component[Index: Integer]: IXMLComponent Read GetComponent; Default;
    Property Name        : WideString Read GetName        Write SetName;
    Property WindowState : WideString Read GetWindowState Write SetWindowState;
    Property X           : Integer    Read GetX           Write SetX;
    Property Y           : Integer    Read GetY           Write SetY;
    Property W           : Integer    Read GetW           Write SetW;
    Property H           : Integer    Read GetH           Write SetH;

  End;

  IXMLItems = Interface;
    
  IXMLItem = Interface(IXMLNode)
    ['{DB380D58-9227-4974-925F-CBC17CD6E118}']
    Function  GetName : WideString;
    Procedure SetName(Value : WideString);

    Function  GetValue : WideString;
    Procedure SetValue(Value : WideString);

    Function  GetExpanded : WideString;
    Procedure SetExpanded(Value : WideString);

    Function  GetIsSelected : WideString;
    Procedure SetIsSelected(Value : WideString);

    Function  GetItems : IXMLItems;

    Property Name       : WideString Read GetName       Write SetName;
    Property Value      : WideString Read GetValue      Write SetValue;
    Property Expanded   : WideString Read GetExpanded   Write SetExpanded;
    Property IsSelected : WideString Read GetIsSelected Write SetIsSelected;
    Property Items      : IXMLItems  Read GetItems;

  End;

  IXMLItems = Interface(IXMLNodeCollection)
    ['{F254002C-A342-49E1-A2F1-C2A2D9FEEFA8}']
    Function GetItem(Index : Integer) : IXMLItem;

    Function Add : IXMLItem;
    Function Insert(Const Index : Integer) : IXMLItem;

    Property Item[Index: Integer]: IXMLItem Read GetItem; Default;

  End;
  
  IXMLTvSettings = Interface(IXMLNodeCollection)
    ['{0CDE0410-CD5D-47F4-8F38-6E1211A7CC87}']

    Function GetItem(Index : Integer) : IXMLItem;

    Function Add : IXMLItem;
    Function Insert(Const Index : Integer) : IXMLItem;

    Property Item[Index: Integer]: IXMLItem Read GetItem; Default;

  End;

  IXMLAppSettings = Interface(IXMLNode)
    ['{6470B3AE-9638-4DB0-BC37-145DA6F0E22D}']
    Function  GetSkinName : WideString;
    Procedure SetSkinName(Value : WideString);

    Function GetForm : IXMLForm;

    Function GetTvSettings : IXMLTvSettings;

    Property SkinName   : WideString     Read GetSkinName Write SetSkinName;
    Property Form       : IXMLForm       Read GetForm;
    Property TvSettings : IXMLTvSettings Read GetTvSettings;

  End;

  TXMLAppSettings = Class(TObject)
  Public
    Class Function GetAppSettings(Doc : IXMLDocument) : IXMLAppSettings;
    Class Function LoadAppSettings(Const FileName : WideString) : IXMLAppSettings;
    Class Function NewAppSettings : IXMLAppSettings;

  End;

Implementation

Type
  TXMLAppSettingsImpl = Class(TXMLNode, IXMLAppSettings)
  Protected
    Function  GetSkinName : WideString;
    Procedure SetSkinName(Value : WideString);

    Function  GetForm : IXMLForm;

    Function  GetTvSettings : IXMLTvSettings;

  Public
    Procedure AfterConstruction; OverRide;

  End;

  TXMLForm = Class(TXMLNodeCollection, IXMLForm)
  Protected
    Function GetName : WideString;
    Procedure SetName(Value : WideString);

    Function GetWindowState : WideString;
    Procedure SetWindowState(Value : WideString);

    Function GetX : Integer;
    Procedure SetX(Value : Integer);

    Function GetY : Integer;
    Procedure SetY(Value : Integer);

    Function GetW : Integer;
    Procedure SetW(Value : Integer);

    Function GetH : Integer;
    Procedure SetH(Value : Integer);

    Function GetComponent(Index : Integer) : IXMLComponent;

    Function Add : IXMLComponent;
    Function Insert(Const Index : Integer) : IXMLComponent;

  Public
    Procedure AfterConstruction; OverRide;

  End;

  TXMLComponent = Class(TXMLNode, IXMLComponent)
  Protected
    Function  GetSettingName : WideString;
    Procedure SetSettingName(Value : WideString);

    Function  GetSettingValue : Integer;
    Procedure SetSettingValue(Value : Integer);

  End;

  TXMLTvSettings = Class(TXMLNodeCollection, IXMLTvSettings)
  Protected
    Function GetItem(Index : Integer) : IXMLItem;
    Function Add : IXMLItem;
    Function Insert(Const Index : Integer) : IXMLItem;

  Public
    Procedure AfterConstruction; OverRide;

  End;

  TXMLItem = Class(TXMLNode, IXMLItem)
  Protected
    Function  GetName : WideString;
    Procedure SetName(Value : WideString);

    Function  GetValue : WideString;
    Procedure SetValue(Value : WideString);

    Function  GetExpanded : WideString;
    Procedure SetExpanded(Value : WideString);

    Function  GetIsSelected : WideString;
    Procedure SetIsSelected(Value : WideString);

    Function  GetItems : IXMLItems;

  Public
    Procedure AfterConstruction; OverRide;

  End;

  TXMLItems = Class(TXMLNodeCollection, IXMLItems)
  Protected
    Function GetItem(Index : Integer) : IXMLItem;
    Function Add : IXMLItem;
    Function Insert(Const Index : Integer) : IXMLItem;

  Public
    Procedure AfterConstruction; OverRide;

  End;

Class Function TXMLAppSettings.GetAppSettings(Doc : IXMLDocument) : IXMLAppSettings;
Begin
  Result := Doc.GetDocBinding('AppSettings', TXMLAppSettingsImpl, '') As IXMLAppSettings;
End;

Class Function TXMLAppSettings.LoadAppSettings(Const FileName : WideString) : IXMLAppSettings;
Begin
  Result := LoadXMLDocument(FileName).GetDocBinding('AppSettings', TXMLAppSettingsImpl, '') As IXMLAppSettings;
End;

Class Function TXMLAppSettings.NewAppSettings : IXMLAppSettings;
Begin
  Result := NewXMLDocument.GetDocBinding('AppSettings', TXMLAppSettingsImpl, '') As IXMLAppSettings;
End;

(******************************************************************************)

Procedure TXMLAppSettingsImpl.AfterConstruction;
Begin
  RegisterChildNode('Form', TXMLForm);
  RegisterChildNode('TvSettings', TXMLTvSettings);
  Inherited;
End;

Function TXMLAppSettingsImpl.GetSkinName : WideString;
Begin
  Result := ChildNodes['SkinName'].Text;
End;

Procedure TXMLAppSettingsImpl.SetSkinName(Value : WideString);
Begin
  ChildNodes['SkinName'].NodeValue := Value;
End;

Function TXMLAppSettingsImpl.GetForm : IXMLForm;
Begin
  Result := ChildNodes['Form'] As IXMLForm;
End;

Function TXMLAppSettingsImpl.GetTvSettings : IXMLTvSettings;
Begin
  Result := ChildNodes['TvSettings'] As IXMLTvSettings;
End;

Procedure TXMLForm.AfterConstruction;
Begin
  RegisterChildNode('Component', TXMLComponent);
  ItemTag := 'Component';
  ItemInterface := IXMLComponent;
  Inherited;
End;

Function TXMLForm.GetName : WideString;
Begin
  Result := AttributeNodes['Name'].Text;
End;

Procedure TXMLForm.SetName(Value : WideString);
Begin
  SetAttribute('Name', Value);
End;

Function TXMLForm.GetWindowState : WideString;
Begin
  Result := AttributeNodes['WindowState'].Text;
End;

Procedure TXMLForm.SetWindowState(Value : WideString);
Begin
  SetAttribute('WindowState', Value);
End;

Function TXMLForm.GetX : Integer;
Begin
  Result := AttributeNodes[WideString('X')].NodeValue;
End;

Procedure TXMLForm.SetX(Value : Integer);
Begin
  SetAttribute(WideString('X'), Value);
End;

Function TXMLForm.GetY : Integer;
Begin
  Result := AttributeNodes[WideString('Y')].NodeValue;
End;

Procedure TXMLForm.SetY(Value : Integer);
Begin
  SetAttribute(WideString('Y'), Value);
End;

Function TXMLForm.GetW : Integer;
Begin
  Result := AttributeNodes[WideString('W')].NodeValue;
End;

Procedure TXMLForm.SetW(Value : Integer);
Begin
  SetAttribute(WideString('W'), Value);
End;

Function TXMLForm.GetH : Integer;
Begin
  Result := AttributeNodes[WideString('H')].NodeValue;
End;

Procedure TXMLForm.SetH(Value : Integer);
Begin
  SetAttribute(WideString('H'), Value);
End;

Function TXMLForm.GetComponent(Index : Integer) : IXMLComponent;
Begin
  Result := List[Index] As IXMLComponent;
End;

Function TXMLForm.Add : IXMLComponent;
Begin
  Result := AddItem(-1) As IXMLComponent;
End;

Function TXMLForm.Insert(Const Index : Integer) : IXMLComponent;
Begin
  Result := AddItem(Index) As IXMLComponent;
End;

Function TXMLComponent.GetSettingName : WideString;
Begin
  Result := AttributeNodes['SettingName'].Text;
End;

Procedure TXMLComponent.SetSettingName(Value : WideString);
Begin
  SetAttribute('SettingName', Value);
End;

Function TXMLComponent.GetSettingValue : Integer;
Begin
  Result := AttributeNodes['SettingValue'].NodeValue;
End;

Procedure TXMLComponent.SetSettingValue(Value : Integer);
Begin
  SetAttribute('SettingValue', Value);
End;

Procedure TXMLTvSettings.AfterConstruction;
Begin
  RegisterChildNode('Item', TXMLItem);
  ItemTag := 'Item';
  ItemInterface := IXMLItem;
  Inherited;
End;

Function TXMLTvSettings.GetItem(Index : Integer) : IXMLItem;
Begin
  Result := List[Index] As IXMLItem;
End;

Function TXMLTvSettings.Add : IXMLItem;
Begin
  Result := AddItem(-1) As IXMLItem;
End;

Function TXMLTvSettings.Insert(Const Index : Integer) : IXMLItem;
Begin
  Result := AddItem(Index) As IXMLItem;
End;

Procedure TXMLItem.AfterConstruction;
Begin
  RegisterChildNode('Items', TXMLItems);
  Inherited;
End;

Function TXMLItem.GetName : WideString;
Begin
  Result := ChildNodes['Name'].Text;
End;

Procedure TXMLItem.SetName(Value : WideString);
Begin
  ChildNodes['Name'].NodeValue := Value;
End;

Function TXMLItem.GetValue : WideString;
Begin
  Result := ChildNodes['Value'].Text;
End;

Procedure TXMLItem.SetValue(Value : WideString);
Begin
  ChildNodes['Value'].NodeValue := Value;
End;

Function TXMLItem.GetExpanded : WideString;
Begin
  Result := ChildNodes['Expanded'].Text;
End;

Procedure TXMLItem.SetExpanded(Value : WideString);
Begin
  ChildNodes['Expanded'].NodeValue := Value;
End;

Function TXMLItem.GetIsSelected : WideString;
Begin
  Result := ChildNodes['IsSelected'].Text;
End;

Procedure TXMLItem.SetIsSelected(Value : WideString);
Begin
  ChildNodes['IsSelected'].NodeValue := Value;
End;

Function TXMLItem.GetItems : IXMLItems;
Begin
  Result := ChildNodes['Items'] As IXMLItems;
End;

Procedure TXMLItems.AfterConstruction;
Begin
  RegisterChildNode('Item', TXMLItem);
  ItemTag := 'Item';
  ItemInterface := IXMLItem;
  Inherited;
End;

Function TXMLItems.GetItem(Index : Integer) : IXMLItem;
Begin
  Result := List[Index] As IXMLItem;
End;

Function TXMLItems.Add : IXMLItem;
Begin
  Result := AddItem(-1) As IXMLItem;
End;

Function TXMLItems.Insert(Const Index : Integer) : IXMLItem;
Begin
  Result := AddItem(Index) As IXMLItem;
End;

End.

