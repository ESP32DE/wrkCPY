{
   Copyright (C) 2006 The devFlowcharter project.
   The initial author of this file is Michal Domagala.

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
}



unit FunctionCall_Block;

interface

uses
   Controls, Forms, StdCtrls, Graphics, Classes, SysUtils, Base_Block, CommonInterfaces;

type

   TFunctionCallBlock = class(TBlock)
      public
         constructor Create(const ABranch: TBranch; const ALeft, ATop, AWidth, AHeight: integer; const AId: integer = ID_INVALID); overload;
         constructor Create(const ABranch: TBranch; const ASource: TFunctionCallBlock); overload;
         constructor Create(const ABranch: TBranch); overload;
         procedure ChangeColor(const AColor: TColor); override;
      protected
         procedure Paint; override;
   end;


implementation

uses
   ApplicationCommon, StrUtils, CommonTypes;

constructor TFunctionCallBlock.Create(const ABranch: TBranch; const ALeft, ATop, AWidth, AHeight: integer; const AId: integer = ID_INVALID);
begin
   FType := blFuncCall;

   inherited Create(ABranch, ALeft, ATop, AWidth, AHeight, AId);

   FStatement.SetBounds(10, 0, AWidth-20, 19);
   FStatement.Anchors := [akRight, akLeft, akTop];
   FStatement.BorderStyle := bsSingle;
   FStatement.Color := GSettings.RoutineColor;

   BottomPoint.X := AWidth div 2;
   BottomPoint.Y := 19;
   IPoint.X := BottomPoint.X + 30;
   IPoint.Y := 30;
   BottomHook := BottomPoint.X;
   TopHook.X := BottomPoint.X;
   Constraints.MinWidth := 140;
   Constraints.MinHeight := 51;
end;

constructor TFunctionCallBlock.Create(const ABranch: TBranch; const ASource: TFunctionCallBlock);
begin
   Create(ABranch, ASource.Left, ASource.Top, ASource.Width, ASource.Height);
   SetFont(ASource.Font);
   Visible := ASource.Visible;
   FStatement.Text := ASource.FStatement.Text;
   if FStatement.CanFocus then
      FStatement.SetFocus;
end;

constructor TFunctionCallBlock.Create(const ABranch: TBranch);
begin
   Create(ABranch, 0, 0, 140, 51);
end;

procedure TFunctionCallBlock.Paint;
begin
   inherited;
   with Canvas do
   begin
      if FStatement <> nil then
      begin
         DrawArrowLine(Point(BottomPoint.X, FStatement.Height-1), Point(BottomPoint.X, Height-1));
         Polygon([Point(8, 0), Point(10, 0),
                  Point(10, FStatement.Height-1),
                  Point(8, FStatement.Height-1),
                  Point(8, 0)]);
         Polygon([Point(Width-11, 0),
                  Point(Width-9, 0),
                  Point(Width-9, FStatement.Height-1),
                  Point(Width-11, FStatement.Height-1),
                  Point(Width-11, 0)]);
         Brush.Style := bsClear;
         if GSettings.RoutineColor <> GSettings.DesktopColor then
            Brush.Color := GSettings.RoutineColor;
         Polygon([Point(0, 0),
                  Point(7, 0),
                  Point(7, FStatement.Height-1),
                  Point(0, FStatement.Height-1),
                  Point(0, 0)]);
         Polygon([Point(Width-8, 0),
                  Point(Width-1, 0),
                  Point(Width-1, FStatement.Height-1),
                  Point(Width-8, FStatement.Height-1),
                  Point(Width-8, 0)]);
      end;
   end;
   DrawI;
end;

procedure TFunctionCallBlock.ChangeColor(const AColor: TColor);
begin
   inherited ChangeColor(AColor);
   if GSettings.RoutineColor = GSettings.DesktopColor then
      FStatement.Color := AColor
   else
      FStatement.Color := GSettings.RoutineColor;
end;

end.