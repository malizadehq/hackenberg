using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.FOE.DataModel.Games;
using System.Runtime.Serialization;
using System.ComponentModel;
using com.FOE.Server.Interface;

namespace com.FOE.Server.DataAccess.Database
{
    partial class DB_Game
    {
        /// <summary>
        /// Do NOT changed the order of these, their values are used in the database.
        /// </summary>
        public enum GamePhases
        {
            [EnumMember]
            [Description("None")]
            None = -1,

            [EnumMember]
            [Description("Buy phase.")]
            Buy = 0,

            [EnumMember]
            [Description("Combat movement phase.")]
            CombatMovement = 1,

            [EnumMember]
            [Description("Combat phase.")]
            Combat = 2,

            [EnumMember]
            [Description("Non combat movement phase.")]
            NonCombatMovement = 3,

            [EnumMember]
            [Description("Troop placement phase.")]
            TroopPlacement = 4,
        }


        /// <summary>
        /// Checks for the Game in the database and updates it if found (excluding Id, MapId and name). If not found in DB it will be created.
        /// </summary>
        /// <param name="game"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static DB_Game FromGame(Game game, FOEDatabaseDataContext context)
        {
            DB_Game da_game = null;
            if(game.Id.HasValue)
                da_game = (from g in context.DB_Games where g.Id == game.Id.Value select g).FirstOrDefault();

            //game didnt exist, create it.
            if(da_game == null)
            {
                da_game = new DB_Game();
                da_game.Id = Guid.NewGuid();
                if (!game.MapId.HasValue)
                    throw new FOEServiceException(FOEStatusCodes.InvalidParameter, "Parameter MapId can not be null");
                da_game.MapId = game.MapId.Value;

                if (!string.IsNullOrEmpty(game.Name))
                    da_game.Name = game.Name;

                context.DB_Games.InsertOnSubmit(da_game);
            }

            //Update the values of the game (excluding Id, MapId and name since we dont ever weant those to change in an update.)
            if (game.GermanPlayer.HasValue)
            {
                da_game.GermanPlayer = game.GermanPlayer.Value;
            }
            if (game.JapanesePlayer.HasValue)
            {
                da_game.JapanesePlayer = game.JapanesePlayer.Value;
            }
            if (game.AmericanPlayer.HasValue)
            {
                da_game.AmericanPlayer = game.AmericanPlayer.Value;
            }
            if (game.GermanPlayer.HasValue)
            {
                da_game.EnglishPlayer = game.GermanPlayer.Value;
            }
            if (game.GermanPlayer.HasValue)
            {
                da_game.RussianPlayer = game.GermanPlayer.Value;
            }
            da_game.Phase = game.Phase;
            da_game.Turn = game.Turn;
            da_game.IsActive = game.IsActive;

            context.SubmitChanges();

            return da_game;
        }


        public Game ToGame()
        {
            Game result = new Game();
            result.Id = Id;
            result.MapId = MapId;
            result.GermanPlayer = GermanPlayer;
            result.JapanesePlayer = JapanesePlayer;
            result.AmericanPlayer = AmericanPlayer;
            result.EnglishPlayer = EnglishPlayer;
            result.RussianPlayer = RussianPlayer;
            result.Phase = Phase.Value;
            result.Turn = Turn;
            result.IsActive = IsActive.Value;

            return result;
        }
    }
}
